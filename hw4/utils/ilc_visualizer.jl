function vis_traj!(vis, name, X; R = 0.1, color = mc.RGBA(1.0, 0.0, 0.0, 1.0))
    # visualize a trajectory expressed with X::Vector{Vector}
    for i = 1:(length(X)-1)
        a = X[i][1:3]
        b = X[i+1][1:3] + 1e-10*ones(3)
        cyl = mc.Cylinder(mc.Point(a...), mc.Point(b...), R)
        mc.setobject!(vis[name]["p"*string(i)], cyl, mc.MeshPhongMaterial(color=color))
    end
    for i = 1:length(X)
        a = X[i][1:3]
        sph = mc.HyperSphere(mc.Point(a...), R)
        mc.setobject!(vis[name]["s"*string(i)], sph, mc.MeshPhongMaterial(color=color))
    end
end

function build_car!(vis)
    L=2.7
    lr=1.5
#     L, lr = model.L,  model.lr
    lf = L - lr
    ww = 0.23     # wheel width (m)
    r = 0.3       # wheel radius (m)
    bw = 0.1      # chassis width (m)
    wheel = mc.Cylinder(mc.Point3f0(0,-ww/2,0), mc.Point3f0(0,ww/2,0), Float32(r))
    body = mc.HyperRectangle(mc.Vec(0,-bw/2,-bw/2), mc.Vec(L,bw,bw))
    setobject!(vis["geom"], mc.Triad()) 
    setobject!(vis["geom"]["chassis"]["body"], body, mc.MeshPhongMaterial(color=colorant"gray"))
    setobject!(vis["geom"]["chassis"]["wheel"], wheel, mc.MeshPhongMaterial(color=colorant"black"))
    setobject!(vis["geom"]["front"]["wheel"], wheel, mc.MeshPhongMaterial(color=colorant"black"))
    settransform!(vis["geom"]["front"], mc.compose(mc.Translation(lf,0,0)))
    settransform!(vis["geom"]["chassis"], mc.compose(mc.Translation(-lr,0,0)))
    settransform!(vis["geom"], mc.Translation(0,0,r))
end  
function RotZ(alf)
    s, c = sin(alf), cos(alf)
    [
        +c  -s  0;
        +s  +c  0;
         0   0  1
    ]
end
function update_car_pose!(vis, x)
    θ = x[3]
    δ = x[4]
    mc.settransform!(vis["geom"], mc.compose(mc.Translation(x[1], x[2],0), mc.LinearMap(RotZ(θ))))
    mc.settransform!(vis["geom"]["front"]["wheel"], mc.LinearMap(RotZ(δ)))
end