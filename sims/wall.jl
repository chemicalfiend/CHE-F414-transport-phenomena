using GLMakie
using Makie.Colors

using SpecialFunctions


ν = 1.0
v0 = 1.0

time = Observable(0.0)

ys = range(0, 7, length=40)

vx = @lift(v0 * erfc.(ys ./ sqrt(4 * ν * $time)))

fig = lines(ys, vx, color = :blue, linewidth = 4,
    axis = (title = @lift("t = $(round($time, digits = 1))"),))

framerate = 30
timestamps = range(0, 10, step=1/framerate)

record(fig, "time_animation.mp4", timestamps;
        framerate = framerate) do t
    time[] = t
end

