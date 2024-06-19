# Amazon S3 CoudUploader CLI 🪣 ☁️

## Before Installing ✋ ⚠️

1. The using of this tool requires an AWS account with an IAM user with permissions to at least push objects to an Amazon S3 Bucket.
2. AWS CLI installed.
3. Make sure to configure your AWS CLI with valid IAM user credentials. [How to guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
4. Operating systems: Linux, Mac OS. If you are using Windows, you can use WSL. [WSL Installation Guide](https://learn.microsoft.com/en-us/windows/wsl/install)

## Setup and Installation 🧰 👷

1. Using a terminal. Create an environment variable to store your S3 Bucket name. Replace `<your-bucket-name>` with the name of your S3 Bucket. Run:

```
export BUCKET_NAME='<your-bucket-name>'
```

2. After cloning the repository, navigate to the repository directory.

3. Run **scriptinstaller.sh** with the command:

```
./scriptinstaller.sh
```

- **If you get a permission denied error, run: `chmod +x scriptinstaller.sh`**.
- **If you are not yet authorized to change the document's permissions, run: `sudo chmod +x scriptinstaller.sh`**.
- **If you still cannot run the script, try: `sudo ./scriptinstaller.sh`**.

4. A successful installation should return the message: **"Installation sucessful. You can now call clouduploader.sh from anywhere."**

- **If the script is already installed at bin directory, you will get the message: "The script is already installed."**

5. Verify that you can call the cloud uploader script by using the command: `clouduploader.sh`. It should return the message: "File: does not exist or is a directory.", since you did not provided any file or path as an argument.

## How to use ⬆️ 🪣 ☁️ 🎆

### Single file:

```
clouduploader.sh file1.mp3
```

### Multiple files:

```
clouduploader.sh ~/songs/mp3/file1.mp3 ./file2.tar ~/moviesDir
```

### Directories

```
clouduploader.sh ~/moviesDir
```

- **If uploading the object(s) to the S3 bucket is successful, the CLI will ask if you want to generate a shareable link to see what is inside the object uploaded to the bucket. Proceed with Y to generate the link**.
- **Shareable links only works with files**
- **You can upload as many files with any extension as you like, but each CLI argument cannot exceed 160 GB**.
