from paraview.simple import *

for s in GetSources().values():
    Delete(s)

sphere1 = Sphere()
renderView1 = GetActiveViewOrCreate('RenderView')

sphere1Display = Show(sphere1, renderView1)
sphere1Display.ColorArrayName = [None, '']

RenderAllViews()

for frame in range(1,10):
    #sphere1Display.DiffuseColor = [frame/10.0, 0.0, 0.0]
    sphere1.Center = [frame/10.0,frame/10.0,0]
    RenderAllViews()
    print frame/10.0
    fname = "animation_%02d.png" % frame
    print fname
    WriteImage(fname)



import os
print "Files were printed to " + os.getcwd()