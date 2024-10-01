
# YouTube Video Downloader (Django)

A Django-based web application that allows users to download YouTube videos or music from playlists. The app utilizes the `pytube` library to fetch and download videos from YouTube servers and transfer them to the user's device.

## Features

- Fully responsive design, working seamlessly across mobile and desktop devices.
- Download individual YouTube videos or entire playlists in multiple formats (e.g., MP4, MP3).
- Simple and user-friendly interface.
- Powered by Django and `pytube` for reliable video processing.

## Prerequisites

Before running this application, ensure that you have the following installed:

- Python 3.10+
- pipenv (for dependency management)
- Docker (if you prefer running it inside a container)

## Installation

### 1. Clone the repository:

```bash
git clone https://github.com/JorkDev/youtube-video-downloader-django.git
cd youtube-video-downloader-django
```

### 2. Set up the environment:

You can install the dependencies using `pipenv`:

```bash
pipenv install --deploy --ignore-pipfile
```

Alternatively, you can install the dependencies directly via `pip`:

```bash
pip install -r requirements.txt
```

### 3. Run the application:

To run the application, execute the following command:

```bash
python manage.py runserver
```

Open your web browser and visit `http://localhost:8000/` to access the app.

## Running with Docker

If you prefer running the application in a Docker container, follow these steps:

### 1. Build the Docker image:

```bash
docker build -t youtube-video-downloader .
```

### 2. Run the Docker container:

```bash
docker run -p 8000:8000 youtube-video-downloader
```

### 3. Access the app:

Open your browser and navigate to `http://localhost:8000/`.

## Usage

1. Paste the URL of the YouTube video or playlist that you want to download.
2. Choose the format (e.g., MP4, MP3).
3. Click the download button to fetch the video.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Feel free to fork the repository and submit pull requests. Contributions are welcome!

## Credits

- Built by JorkDev.
- Powered by [Django](https://www.djangoproject.com/) and [pytube](https://pytube.io/).
