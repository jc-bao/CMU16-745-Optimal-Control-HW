function build_walker!(vis, model::NamedTuple)
    l,w,h = 0.4,0.4,0.6
    body = mc.HyperRectangle(mc.Vec(-l/2,-w/2,0), mc.Vec(l,w,h)) 
    body = mc.GeometryBasics.Sphere(mc.Point(0.0,0.0,0.0), 7l/16)
    setobject!(vis["robot"]["torso"]["body"], body, MeshPhongMaterial(color=colorant"gray"))
    axle = mc.Cylinder(mc.Point(0.0,0.0,0.0), mc.Point(0.0,w/2,0.0), 0.03)
    setobject!(vis["robot"]["torso"]["Laxle"], axle, MeshPhongMaterial(color=colorant"black"))
    setobject!(vis["robot"]["torso"]["Raxle"], axle, MeshPhongMaterial(color=colorant"black"))
    settransform!(vis["robot"]["torso"]["Laxle"], mc.Translation(0,+l/4,0))
    settransform!(vis["robot"]["torso"]["Raxle"], mc.Translation(0,-3l/4,0))

    foot = mc.HyperSphere(mc.Point(0.0,0.0,0.0), 0.05)
    Lfoot = setobject!(vis["robot"]["Lfoot"]["geom"], foot, MeshPhongMaterial(color=colorant"firebrick"))
    setobject!(vis["robot"]["Rfoot"]["geom"], foot, MeshPhongMaterial(color=colorant"firebrick"))
    settransform!(vis["robot"]["Lfoot"]["geom"], mc.Translation(0,+l/2,0))
    settransform!(vis["robot"]["Rfoot"]["geom"], mc.Translation(0,-l/2,0))

    Lleg = mc.Cylinder(mc.Point(0.,+l/2,0.), mc.Point(0.,+l/2,1.), 0.03)
    Rleg = mc.Cylinder(mc.Point(0.,-l/2,0.), mc.Point(0.,-l/2,1.), 0.03)
    setobject!(vis["robot"]["torso"]["Lleg"]["geom"], Lleg, MeshPhongMaterial(color=colorant=colorant"green"))
    setobject!(vis["robot"]["torso"]["Rleg"]["geom"], Rleg, MeshPhongMaterial(color=colorant=colorant"green"))
    # settransform!(vis["robot"]["torso"]["Lleg"]["geom"], Translation(0,+l/2,0))
    # settransform!(vis["robot"]["torso"]["Rleg"]["geom"], Translation(0,-l/2,0))

    return Lfoot
end
function RotY(θ)
    s, c = sincos(θ)
    [c 0 s; 0 1 0;-s 0 c]
end
function update_walker_pose!(vis, model::NamedTuple, x::Vector)
    xb,yb = x[1],x[2]
    xl,yl = x[3],x[4]
    xr,yr = x[5],x[6]
    settransform!(vis["robot"]["torso"], mc.Translation(xb,0,yb))
    settransform!(vis["robot"]["Lfoot"], mc.Translation(xl,0,yl))
    settransform!(vis["robot"]["Rfoot"], mc.Translation(xr,0,yr))

    Llen = norm(SA[xl-xb, yl-yb])
    Rlen = norm(SA[xr-xb, yr-yb])
    θl = atan(xl-xb, yl-yb)
    θr = atan(xr-xb, yr-yb)
    settransform!(vis["robot"]["torso"]["Lleg"], mc.LinearMap(RotY(θl)))
    settransform!(vis["robot"]["torso"]["Rleg"], mc.LinearMap(RotY(θr)))

    settransform!(vis["robot"]["torso"]["Lleg"]["geom"], mc.LinearMap(Diagonal([1,1,Llen])))
    settransform!(vis["robot"]["torso"]["Rleg"]["geom"], mc.LinearMap(Diagonal([1,1,Rlen])))
end