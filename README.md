# Pivot Index Coding Challenge

Given this was a coding challenge I refrained from jumping on Google straight away and gave it a crack on my own.

Then once I was done looked it up on Google briefly, I couldn't gone for a full search, an idea was enough.

Found a nice solution that was quick and provided a prompt to further optimise my solution.

There is an issue with the solution I found on Google as it assumes the left side will always be smaller that the right.

This doesn't work well with negative numbers. My solution is a bit slower howevr it is correct. Given the problem presented a slower correct solution should win vs a fast wrong solution.

## Performance

Can see some benchmarks in [pivot_benchmark.rb](https://github.com/SoreGums/pivot/blob/master/pivot_benchmark.rb#L7)

```
100_000x iterations (before google)
                              user     system      total        real
 pivot 6 random numbers >   0.638279   0.002733   0.641012 (  0.662562)
 pivot 12 random numbers >  1.358022   0.000068   1.358090 (  1.403958)
 pivot 6 numbers pi 2 >     0.283127   0.000000   0.283127 (  0.291566)
 pivot 12 numbers pi 2 >    0.340091   0.000000   0.340091 (  0.345404)
 pivot 6 numbers pi -1 >    0.557838   0.000000   0.557838 (  0.569817)
 pivot 12 numbers pi -1 >   1.032317   0.000000   1.032317 (  1.050658)
 pivot 12 numbers pi 7 >    0.694308   0.000000   0.694308 (  0.707950)
 ```

 ```
100_000x iterations (after google), that's more like it
                              user     system      total        real
 pivot 6 random numbers >   0.636163   0.000000   0.636163 (  0.661932)
 pivot 12 random numbers >  0.872095   0.006485   0.878580 (  0.917546)
 pivot 6 numbers pi 2 >     0.089273   0.000007   0.089280 (  0.090611)
 pivot 12 numbers pi 2 >    0.130946   0.000002   0.130948 (  0.133861)
 pivot 6 numbers pi -1 >    0.449267   0.003355   0.452622 (  0.472596)
 pivot 12 numbers pi -1 >   0.469379   0.000000   0.469379 (  0.480851)
 pivot 12 numbers pi 7 >    0.166484   0.000000   0.166484 (  0.168059)
```

```
Fastest results for the Google solution, while faster - can't handle negative numbers properly
 so given the criteria of "a list of integers" -1000 is a valid integer it is a fast solution sometimes
   task wasn't to find pivot index sometimes - fast and wrong is still wrong.
100_000x iterations (google solution)
                              user     system      total        real
 pivot 6 random numbers >   0.327158   0.000089   0.327247 (  0.333854)
 pivot 12 random numbers >  0.516682   0.003352   0.520034 (  0.532952)
 pivot 6 numbers pi 2 >     0.114245   0.000029   0.114274 (  0.118026)
 pivot 12 numbers pi 2 >    0.137428   0.000008   0.137436 (  0.140783)
 pivot 6 numbers pi -1 >    0.101859   0.000000   0.101859 (  0.103363)
 pivot 12 numbers pi -1 >   0.188803   0.003408   0.192211 (  0.198687)
 pivot 12 numbers pi 7 >    0.167411   0.003217   0.170628 (  0.172410)
 ```
