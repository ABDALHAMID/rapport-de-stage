<?php
// Load the tasks from the JSON file
$tasksFile = 'tasks.json';
$tasksData = json_decode(file_get_contents($tasksFile), true);
$tasks = $tasksData['tasks'] ?? [];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
    // Edit task logic
    $taskIndex = $_POST['task_index'];
    $tasks[$taskIndex]['task_name'] = $_POST['task_name'];
    $tasks[$taskIndex]['start_date'] = $_POST['start_date'];
    $tasks[$taskIndex]['finish_date'] = $_POST['finish_date'];
    $tasks[$taskIndex]['development_days'] = (int)$_POST['development_days'];
    $tasks[$taskIndex]['task_description'] = $_POST['task_description'];
    $tasks[$taskIndex]['task_reference'] = $_POST['task_reference'];
    $tasks[$taskIndex]['epic_name'] = $_POST['epic_name'];
    $tasks[$taskIndex]['module'] = $_POST['module'];
    $tasks[$taskIndex]['task_type'] = $_POST['task_type'];

    // Save the updated tasks back to the JSON file
    file_put_contents($tasksFile, json_encode(['tasks' => $tasks], JSON_PRETTY_PRINT));
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task Manager</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f4f4f4; }
        form { display: none; margin-top: 20px; }
    </style>
</head>
<body>

<h1>Task Manager</h1>

<table>
    <tr>
        <th>Task Name</th>
        <th>Task Reference</th>
        <th>Start Date</th>
        <th>Finish Date</th>
        <th>Development Days</th>
        <th>Task Description</th>
        <th>Edit</th>
    </tr>
    <?php foreach ($tasks as $index => $task): ?>
    <tr>
        <td><?php echo htmlspecialchars($task['task_name']); ?></td>
        <td><?php echo htmlspecialchars($task['task_reference']); ?></td>
        <td><?php echo htmlspecialchars($task['start_date']); ?></td>
        <td><?php echo htmlspecialchars($task['finish_date']); ?></td>
        <td><?php echo htmlspecialchars($task['development_days']); ?></td>
        <td><?php echo htmlspecialchars($task['task_description']); ?></td>
        <td>
            <button onclick="editTask(<?php echo $index; ?>)">Edit</button>
        </td>
    </tr>
    <?php endforeach; ?>
</table>

<div id="edit-form" style="display:none;">
    <h2>Edit Task</h2>
    <form method="POST" id="taskForm">
        <input type="hidden" name="task_index" id="task_index">
        <label>Task Name: <input type="text" name="task_name" id="task_name"></label><br>
        <label>Start Date: <input type="date" name="start_date" id="start_date"></label><br>
        <label>Finish Date: <input type="date" name="finish_date" id="finish_date"></label><br>
        <label>Development Days: <input type="number" name="development_days" id="development_days"></label><br>
        <label>Task Description: <textarea name="task_description" id="task_description"></textarea></label><br>
        <label>Task Reference: <input type="text" name="task_reference" id="task_reference"></label><br>
        <label>Epic Name: <input type="text" name="epic_name" id="epic_name"></label><br>
        <label>Module: <input type="text" name="module" id="module"></label><br>
        <label>Task Type: <input type="text" name="task_type" id="task_type"></label><br>
        <input type="submit" name="submit" value="Submit">
    </form>
</div>

<script>
    function editTask(index) {
        var task = <?php echo json_encode($tasks); ?>[index];
        document.getElementById('task_index').value = index;
        document.getElementById('task_name').value = task.task_name;
        document.getElementById('start_date').value = task.start_date;
        document.getElementById('finish_date').value = task.finish_date;
        document.getElementById('development_days').value = task.development_days;
        document.getElementById('task_description').value = task.task_description;
        document.getElementById('task_reference').value = task.task_reference;
        document.getElementById('epic_name').value = task.epic_name;
        document.getElementById('module').value = task.module;
        document.getElementById('task_type').value = task.task_type;
        document.getElementById('edit-form').style.display = 'block';
    }
</script>

</body>
</html>
