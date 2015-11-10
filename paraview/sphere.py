from paraview.simple import *

try:
    Delete()
    print "Deleted pipeline"
except:
    print "Nothing in pipeline to delete"

print "Executing Macro sphere.py"

Sphere()
Show()
Render()
SetDisplayProperties(Opacity=0.5)
SetProperties(Center=[1,0,0])
Render()
