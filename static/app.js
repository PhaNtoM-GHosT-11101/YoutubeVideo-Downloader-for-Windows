const form = document.querySelector("#download-form");
const button = document.querySelector("#start");
const panel = document.querySelector("#panel");
const statusText = document.querySelector("#status");
const percentText = document.querySelector("#percent");
const fill = document.querySelector("#fill");
const details = document.querySelector("#details");

let timer = null;

function setProgress(job) {
  const percent = Math.max(0, Math.min(100, Number(job.percent || 0)));
  statusText.textContent = job.status || "Working";
  percentText.textContent = `${percent.toFixed(1)}%`;
  fill.style.width = `${percent}%`;
  details.className = job.error ? "details error" : "details";
  details.textContent = job.error || job.filename || job.message || "";
}

async function poll(jobId) {
  const response = await fetch(`/status/${jobId}`);
  const job = await response.json();
  setProgress(job);

  if (job.done || job.error) {
    clearInterval(timer);
    button.disabled = false;
    button.textContent = "Download";
  }
}

form.addEventListener("submit", async (event) => {
  event.preventDefault();
  clearInterval(timer);

  panel.style.display = "block";
  button.disabled = true;
  button.textContent = "Starting...";
  setProgress({ status: "Starting", percent: 0, message: "Preparing download..." });

  const response = await fetch("/download", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ url: document.querySelector("#url").value }),
  });
  const result = await response.json();

  if (!response.ok) {
    setProgress({ status: "Error", percent: 0, error: result.error || "Could not start download." });
    button.disabled = false;
    button.textContent = "Download";
    return;
  }

  button.textContent = "Downloading...";
  timer = setInterval(() => poll(result.job_id), 1000);
  poll(result.job_id);
});
