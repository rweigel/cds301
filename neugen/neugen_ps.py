import math

S = list()
A = list()

#fid = open("/Users/robertweigel/Desktop/git/cds301/NuGen.txt")
fid = open("/home/weigel/git/cds301/neugen/neugen.txt")
s = 0
a = 0
while 1:
	line = fid.readline()

	if not line:
		break

	if line.find("begin soma") == 0:
		S.append([])
		n = fid.readline()
		tmp = ""
		for x in range(0, int(n)):
			tmp += fid.readline()
		S[s] = tmp
		#print S[s]
		s = s+1

	if line.find("begin axon") == 0:
		A.append([])
		p = fid.readline()
		n = fid.readline()
		print n
		tmp = ""
		for x in range(0, int(n)):
			tmp += fid.readline()
		print tmp
		A[a] = tmp
		print A[a]
		a = a+1

fid.close()

numPts = 80 # Points along Helix
length = 8.0 # Length of Helix
rounds = 3.0 # Number of times around

#Get a vtk.PolyData object for the output
pdo = self.GetPolyDataOutput()

#This will store the points for the Helix
newPts = vtk.vtkPoints()
for i in range(0, numPts):
   #Generate the Points along the Helix
   x = i*length/numPts
   y = math.sin(i*rounds*2*math.pi/numPts)
   z = math.cos(i*rounds*2*math.pi/numPts)
   #Insert the Points into the vtkPoints object
   #The first parameter indicates the reference.
   #value for the point. Here we add them sequentially.
   #Note that the first point is at index 0 (not 1).
   newPts.InsertPoint(i, x,y,z)

#Add the points to the vtkPolyData object
#Right now the points are not associated with a line - 
#it is just a set of unconnected points. We need to
#create a 'cell' object that ties points together
#to make a curve (in this case). This is done below.
#A 'cell' is just an object that tells how points are
#connected to make a 1D, 2D, or 3D object.
pdo.SetPoints(newPts)

#Make a vtkPolyLine which holds the info necessary
#to create a curve composed of line segments. This
#really just hold constructor data that will be passed
#to vtkPolyData to add a new line.
aPolyLine = vtk.vtkPolyLine()

#Indicate the number of points along the line
aPolyLine.GetPointIds().SetNumberOfIds(numPts)
for i in range(0,numPts):
   #Add the points to the line. The first value indicates
   #the order of the point on the line. The second value
   #is a reference to a point in a vtkPoints object. Depends
   #on the order that Points were added to vtkPoints object.
   #Note that this will not be associated with actual points
   #until it is added to a vtkPolyData object which holds a
   #vtkPoints object.
   aPolyLine.GetPointIds().SetId(i, i)

#Allocate the number of 'cells' that will be added. We are just
#adding one vtkPolyLine 'cell' to the vtkPolyData object.
pdo.Allocate(1, 1)

#Add the poly line 'cell' to the vtkPolyData object.
pdo.InsertNextCell(aPolyLine.GetCellType(), aPolyLine.GetPointIds())
