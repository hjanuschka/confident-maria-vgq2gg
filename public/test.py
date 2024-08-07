import base64
import cv2



def footage_to_frame(video):
    vidcap = cv2.VideoCapture(video)
    frames = []

    #  read until no more frames exist in the video
    while True:
        success, frame = vidcap.read()
        if (success):
            frames.append(frame)
        else:
            #  unable to read a frame
            break
 
    return frames


def frames_to_base64(frames):
    frames_b64 = []
    #  iterate frames and convert each of them to base64
    for frame in frames:
        frames_b64.append(base64.b64encode(frame))
    return frames_b64
    
frames = footage_to_frame('ganeshFace.mp4')
frames_b64 = frames_to_base64(frames)
return frames_b64