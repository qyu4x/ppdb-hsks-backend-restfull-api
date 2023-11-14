<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Kak Seto School API</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #ffffff;
            font-family: 'Arial', sans-serif;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin: 20px; /* Add margin around the container */
        }

        .image-container {
            width: 20vw;
            height: 20vw;
            border-radius: 50%;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        h1 {
            font-size: 2.5em;
            color: #333;
            margin: 10px 0; /* Adjust the margin top and bottom */
        }

        p {
            font-size: 1.2em;
            color: #555;
            margin-bottom: 20px; /* Add some margin below the paragraph */
        }

        .footer {
            margin-top: 20px; /* Add margin above the footer */
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-container">
            <img src="https://i.ibb.co/b7JJym7/aa8f7717e512eaa465a38199574a0eb1.jpg" alt="Kak Seto School">
        </div>
        <h1>Welcome to Kak Seto School API</h1>
        <p>This API endpoint serves data related to Kak Seto School. Explore and discover the information you need.</p>
        <p>Build with love<br>5th Batch of Kampus Merdeka Internship Team</p>
        <div class="footer">Powered by Kak Seto School API</div>
    </div>
</body>
</html>

