#### import the simple module from the paraview                                                                     
from paraview.simple import *

for s in GetSources().values():
    Delete(s)

paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Cylinder'                                                                                           
cylinder1 = Cylinder()

# create a new 'Sphere'                                                                                             
sphere1 = Sphere()

# get active view                                                                                                   
renderView1 = GetActiveViewOrCreate('RenderView')

cylinder1Display = Show(cylinder1, renderView1)
cylinder1Display.ColorArrayName = [None, '']

sphere1Display = Show(sphere1, renderView1)
sphere1Display.ColorArrayName = [None, '']

# change solid color                                                                                                
cylinder1Display.DiffuseColor = [0.0, 0.0, 1.0]
sphere1Display.DiffuseColor = [1.0, 0.0, 0.0]

sphere1.Center = [0.0, 1.0, 0.0]

renderView1.CameraViewUp = [0,0,1]

RenderAllViews()
