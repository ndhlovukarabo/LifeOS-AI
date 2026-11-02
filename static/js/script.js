
// Hamburger code
if (Hamburger && navlinks) {
    Hamburger.addEventListener("click", () => {
        navlinks.classList.toggle("active");
    });
}


// Select all task checkbox
let task_checkboxes = document.querySelectorAll(".task-item input[type='checkbox']");
// adding a change  eventlistener to each checkbox
task_checkboxes.forEach((checkbox) => {
	//get the id from the checkbox
	checkbox.addEventListener("change", () =>{
		let task_id =checkbox.dataset.taskId;
		//get the checkbox status
		let is_completed = checkbox.checked;

		// Send the task infoemation to Flask
		fetch("/update_task", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				task_id: task_id,
				is_completed: is_completed
			})
		})

       .then(response => response.json())
	   .then(data => {
		console.log("Task updated:", data);
	   })
	   .catch(error => {
		console.error("Error updating task:", error);
	   });

		

	} );
});
