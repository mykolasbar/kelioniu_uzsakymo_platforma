<h2>Description</h2>

A hotel management system with registered user and admin roles, in addition to unregistered user. UI in lithuanian. Functionality for viewing, searching and booking hotels on the user side and adding, removing and updating hotels, as well as confirming orders, on the admin side.

React.js used for frontend and Laravel for backend. Used token-based authentication with sanctum, in addition to protected routes on the frontend.

This is the backend repository. You can access the frontend repository <a href = "https://github.com/mykolasbar/kelioniu_uzsakymo_platforma_fe/">here</a>.

<h2>Instructions for launch</h2>

<h2>Functionality</h2>

<ul>
    <li>User roles:<li>
        <ul>
            <li>Unregistered user</li>
            <li>Registered user</li>
            <li>Admin</li>
        </ul>
    <li>Unregistered user:</li>
        <ul>
            <li>View schools</li>
            <li>Search schools (by their name)</li>
        </ul>
    <li>Regular user:</li>
        <ul>
            <li>View schools</li>
            <li>Search schools (by their name)</li>
            <li>Add one or more pupils</li>
            <li>Send a request for a pupil to be registered to a particular school</li>
        </ul>
    <li>Admin</li>
        <ul>
            <li>Add, update, delete schools</li>
            <li>Add pupils</li>
            <li>See list of incoming requests</li>
            <li>Confirm pupil requests</li>
        </ul>
</ul>

<h2>Launch instructions</h2>

The project is not deployed online, so in order to view it, you will have to download it from github and launch it on the live server.

<ul>
    <li>Clone or download the github repository and put it in your xampp htdocs folder</li>
    <li>Import the database (Dump20221104.sql file in the downloaded repository) with MySQL Workbench or similar software</li>
    <li>Launch the development server on the default port http://127.0.0.1:8000/ (php artisan serve on your cli if you have laravel installed)</li>
</ul>

Made by Mykolas Baranauskas. <a href = "https://www.linkedin.com/in/mykolas-baranauskas-b3809b110/" target = "_blank">Linkedin</a>.
