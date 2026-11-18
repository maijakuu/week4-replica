const counterValue = document.querySelector(".counter__value");
const counterStatus = document.querySelector("#counter-status");

fetch("/viikko4/api/loads", { cache: "no-store" })
  .then((response) => {
    if (!response.ok) {
      throw new Error(`Counter request failed: ${response.status}`);
    }
    return response.json();
  })
  .then(({ total_loads: totalLoads }) => {
    counterValue.textContent = totalLoads;
    counterStatus.textContent = "";
  })
  .catch((error) => {
    console.error(error);
    counterStatus.textContent = "Unable to read the replicated counter.";
  });
