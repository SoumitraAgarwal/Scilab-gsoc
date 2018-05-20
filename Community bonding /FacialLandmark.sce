pyImport cv2
pyImport numpy
pyImport pandas

np = numpy;
py = pyBuiltin();
pd = pandas;

faceCascade1 = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml')

frame 	= cv2.imread('test.jpg')
frbw 	= cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

gray 	= np.asarray(frbw)
faces1 = faceCascade1.detectMultiScale(gray, 1.1, 5)


// Draw a rectangle around the faces
//for (x, y, w, h) in faces1:
//	cv.rectangle(frame, (x, y), (x+w, y+h), (0, 0, 255), 2)
//	roi_gray = gray[y:y+h, x:x+w]
//	roi_color = frame[y:y+h, x:x+w]

//cv.imwrite('result.jpg', frbw)