<html>
<video id="screenRecording" controls></video>
<a id="downloadLink" href="#" download="screen_recording.mp4">Download Screen Recording</a>
<button onclick="startScreenRecording()">Start Recording</button>
<button onclick="stopScreenRecording()">Stop Recording</button>


</html>

<script>
    let recorder;

// Function to start screen recording
function startScreenRecording() {
    navigator.mediaDevices.getDisplayMedia({ video: true })
    .then(function(stream) {
        recorder = RecordRTC(stream, {
            type: 'video'
        });

        recorder.startRecording();

        // You can also display the screen recording in a video element
        let videoElement = document.getElementById('screenRecording');
        videoElement.srcObject = stream;
        videoElement.play();
    })
    .catch(function(error) {
        console.error('Error accessing screen:', error);
    });
}

// Function to stop screen recording
function stopScreenRecording() {
    if (recorder) {
        recorder.stopRecording(function() {
            let blob = recorder.getBlob();
            let url = URL.createObjectURL(blob);

            // Set video source and download link href
            let videoElement = document.getElementById('screenRecording');
            videoElement.src = url;

            let downloadLink = document.getElementById('downloadLink');
            downloadLink.href = url;
        });
    }
}

</script>