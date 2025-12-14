# the computationalist manifesto
## chapter 0 - preface
if you are reading this, you're witnessing and participating in a miraculous feat achieved only very recently in human history. written text is not built into language, but an invented technology -- language is based on sound, and recording the vibrations of our vocal cords as symbols, then decoding them with our eyes, is not something we are born to do.

almost all humans who have ever lived were illiterate. for millennia, humans passed stories and wisdom from generation to generation verbally. only a few places invented writing independently, and only the privileged could master this technology. how insane it would have sounded to them that nowadays an ordinary person can shame politicians and people in power for misspelling a word or mispronouncing a character. how far we have come as a civilization -- and most of that achieved within the last hundred years!

what if this is just the beginning of something far greater, and we are nowhere near realizing our true potential as a species? what if we continue the effort to encourage ordinary people to distill, externalize, and preserve their mental processes? not just the utterance of words, but the formal, logical, and mathematical thinking, and in particular, computational thinking.

"that's absurd," you might say. "very few could grasp such abstract concepts!"

and yet, consider how writing was once the exclusive domain of priests, scribes, and officials. programming today is much the same: programmers are treated as priests in the church of computation, a special class of people granted direct access to sacred knowledge, an indispensable intermediary for the rest of the populace.

"STEM!" they say. but i say: "let's do away with the priesthood!"

consider another kind of abstract symbols: sheet music. what is a 1/128 note? what is "sforzando piano"? and yet, there is no corner of the world where humans have walked that does not hear music. we must distinguish between sheet music -- a technology for preserving and communicating music -- and the entirely separate, universal, innate human capacity to comprehend and create music.

we understand rhythm intimately: our hearts beat at a regular interval, we breathe, in, out, in, out, and we walk, left, right, left, right. computation is no different. it too is a music within us, woven into the cadence of all of our actions. this is how you open a door -- repeat the following: if my hand can reach the handle, stop; otherwise, left foot, right foot. if the door is locked, unlock it. with the door unlocked, turn the handle. just like language and music, computation unfolds over time and permeates our existence. is it not possible that we are born with the capacity for computational thinking, just as we are born with vocal cords and tongue muscles to make distinct sounds that carry meaning? and just as you don't need to be literate to be a good orator, and you don't need to read sheet music to be a good singer, you also don't need to parse english-like text filled with cryptic symbols to be a good computationalist. we are all born with the potential to be an orator, a musician, and a computationalist.

so what's to be done? 

first of all, our current approach to teaching programming, and more broadly, mathematics, is fundamentally flawed. you wouldn't teach a person who has never heard music before by starting with sheet music notation. instead, you'd probably show them what sounds exist in the world, and how to make them by pressing a key, plucking a string, or blowing into a cavity. you'd let them compare pitches and timbres, and try to sequence and layer them. they'd be immediately intrigued, because the experience is visceral.

perhaps the same applies to programming education. instead of teaching beginners commands, keywords, subroutines, classes, and all kinds of syntactic and semantic constructs, maybe we could start with a video game that provides an extremely simplified view of what's actually going on in a computer's circuitry, using a grid of registers where you can drag things around and combine them. you could then record and play back what you've just performed, and further combine those recordings into richer, more interesting sequences -- like live looping, where you progressively add more elements. we could even extend the live looping metaphor to include recording and playing back the action of recording and playing back itself -- a meta-recording! in this way, we can introduce, simultaneously, at a lower abstraction level, registers and instructions, and at a higher level, recursion and composition. no symbols. no syntax. once they are comfortable with this process, the final reveal:

"you have been programming this whole time!"

this is not a prescription, but an example to illustrate the principle that computation can be experienced before being written down as a program to be executed. to experience water is to stick our hand into a chilly stream and let it flow through our fingers -- not stare at a formula and regurgitate: dihydrogen monoxide! i believe that once we break free from conflating experiencing computation with encoding it symbolically, the possibilities are limitless. the symbols, the syntax, the abstract constructs -- these remain our destination, the sheet music that crystallizes what we've composed. but first, we must learn to hear the sounds, and then to compose the music, so that we might have something worth preserving.

so why am i writing this? because this is not an ideal to contemplate. it is a battle to be waged.

we are a fundamentally creative species waiting for a spark. silicon valley once brought us the promethean fire from the universities and national laboratories, but the fire has always been shielded from us in shiny crystal boxes, to be gazed upon, but not tampered with. and today social media and generative ai -- creations by the high priests of computation, in the name of progress and democracy -- relentlessly strip us of that creative agency, reducing us from natural orators, musicians, and computationalists into idle observers and consumers, marvelling, paralyzed. this is why we must sound the death knell of the priesthood of computation, especially now, in this age of disempowerment, when old ideals of rationality and optimism are giving way to cynical, nihilistic despair.

at this very moment, the music plays on in silence.

let it be heard.

## chapter 1. a visual architecture

this is a spreadsheet-inspired Harvard architecture with 2d addressable data memory for teaching programming fundamentals. 

### state
```
dmem[row, col]: N x N ->  R    // data memory
imem[addr]: N -> instruction   // instruction memory
bp_stack: Stack(N)             // base pointer stack
ra_stack: Stack(N)             // return address stack
fn_stack: Stack(N)             // function address stack
pc: N                          // program counter
```

### addressing
```
bp = top(bp_stack)

direct:    [i,j] → dmem[bp+i, j]
indirect:  [[i,j]] → dmem[decode(dmem[bp+i, j])]
```

##### pairing function (hardware):
```
encode: N x N -> N
decode: N -> N x N
```

###### example (cantor pairing):
```
encode(0,0) = 0      decode(0) = (0,0)
encode(0,1) = 1      decode(1) = (0,1)
encode(1,0) = 2      decode(2) = (1,0)
encode(1,1) = 4      decode(4) = (1,1)
encode(2,0) = 3      decode(3) = (2,0)
```

### instructions

#### data movement
```
1.  loadi [i,j] r              // dmem[bp+i,j] = r
2.  loadi [[i,j]] r            // dmem[decode(dmem[bp+i,j])] = r

3.  mov [i,j] [k,l]            // dmem[bp+i,j] = dmem[bp+k,l]
4.  mov [[i,j]] [k,l]          // dmem[decode(dmem[bp+i,j])] = dmem[bp+k,l]
5.  mov [i,j] [[k,l]]          // dmem[bp+i,j] = dmem[decode(dmem[bp+k,l])]
6.  mov [[i,j]] [[k,l]]        // dmem[decode(dmem[bp+i,j])] = dmem[decode(dmem[bp+k,l])]
```
#### arithmetic (20)
```
7.  add [i,j] [k,l]            // dmem[bp+i,j] += dmem[bp+k,l]
8.  add [[i,j]] [k,l]          // dmem[decode(dmem[bp+i,j])] += dmem[bp+k,l]
9.  add [i,j] [[k,l]]          // dmem[bp+i,j] += dmem[decode(dmem[bp+k,l])]
10. add [[i,j]] [[k,l]]        // dmem[decode(dmem[bp+i,j])] += dmem[decode(dmem[bp+k,l])]

11. sub [i,j] [k,l]            // dmem[bp+i,j] -= dmem[bp+k,l]
12. sub [[i,j]] [k,l]          // dmem[decode(dmem[bp+i,j])] -= dmem[bp+k,l]
13. sub [i,j] [[k,l]]          // dmem[bp+i,j] -= dmem[decode(dmem[bp+k,l])]
14. sub [[i,j]] [[k,l]]        // dmem[decode(dmem[bp+i,j])] -= dmem[decode(dmem[bp+k,l])]

15. mul [i,j] [k,l]            // dmem[bp+i,j] *= dmem[bp+k,l]
16. mul [[i,j]] [k,l]          // dmem[decode(dmem[bp+i,j])] *= dmem[bp+k,l]
17. mul [i,j] [[k,l]]          // dmem[bp+i,j] *= dmem[decode(dmem[bp+k,l])]
18. mul [[i,j]] [[k,l]]        // dmem[decode(dmem[bp+i,j])] *= dmem[decode(dmem[bp+k,l])]

19. div [i,j] [k,l]            // dmem[bp+i,j] /= dmem[bp+k,l]
20. div [[i,j]] [k,l]          // dmem[decode(dmem[bp+i,j])] /= dmem[bp+k,l]
21. div [i,j] [[k,l]]          // dmem[bp+i,j] /= dmem[decode(dmem[bp+k,l])]
22. div [[i,j]] [[k,l]]        // dmem[decode(dmem[bp+i,j])] /= dmem[decode(dmem[bp+k,l])]

23. mod [i,j] [k,l]            // dmem[bp+i,j] %= dmem[bp+k,l]
24. mod [[i,j]] [k,l]          // dmem[decode(dmem[bp+i,j])] %= dmem[bp+k,l]
25. mod [i,j] [[k,l]]          // dmem[bp+i,j] %= dmem[decode(dmem[bp+k,l])]
26. mod [[i,j]] [[k,l]]        // dmem[decode(dmem[bp+i,j])] %= dmem[decode(dmem[bp+k,l])]
```
#### addressing
2D addressing requires encoding (row, col) pairs into single values for indirection. 
```
27. ptr [i,j] [k,l]            // dmem[bp+i,j] = encode(bp+k, l)

28. ptradd [i,j] [k,l]         // n = dmem[bp+k,l]
                               // (r,c) = decode(dmem[bp+i,j])
                               // dmem[bp+i,j] = encode(r, c+n)
```
#### control
```
29. blt [i,j] [k,l] addr       // if dmem[bp+i,j] < dmem[bp+k,l], pc = addr
30. blt [[i,j]] [k,l] addr     // if dmem[decode(dmem[bp+i,j])] < dmem[bp+k,l], pc = addr
31. blt [i,j] [[k,l]] addr     // if dmem[bp+i,j] < dmem[decode(dmem[bp+k,l])], pc = addr
32. blt [[i,j]] [[k,l]] addr   // if dmem[decode(dmem[bp+i,j])] < dmem[decode(dmem[bp+k,l])], pc = addr

33. beq [i,j] [k,l] addr       // if dmem[bp+i,j] == dmem[bp+k,l], pc = addr
34. beq [[i,j]] [k,l] addr     // if dmem[decode(dmem[bp+i,j])] == dmem[bp+k,l], pc = addr
35. beq [i,j] [[k,l]] addr     // if dmem[bp+i,j] == dmem[decode(dmem[bp+k,l])], pc = addr
36. beq [[i,j]] [[k,l]] addr   // if dmem[decode(dmem[bp+i,j])] == dmem[decode(dmem[bp+k,l])], pc = addr

37. br addr                    // pc = addr

38. call label                 // push(ra_stack, pc+1)
                               // push(bp_stack, bp + imem[top(fn_stack)])
                               // push(fn_stack, label)
                               // pc = label+1

39. ret                        // pop(fn_stack)
                               // pop(bp_stack)
                               // pc = pop(ra_stack)
```

### function structure
```
imem[addr]:     frame_size (N)
imem[addr+1]:   instruction_1
imem[addr+2]:   instruction_2
...
```

### data layout

variables may be placed in any cell. multiple variables may occupy the same row. 
arrays must grow horizontally across columns.

example:
```
     col0     col1     col2     col3     col4     col5
row0 [x:5]    [y:3]    [sum:8]                            // multiple scalars in one row
row1 [arr0]   [arr1]   [arr2]   [arr3]   [arr4]           // array grows horizontally
row2 [i:0]    [ptr]    [temp]                             // loop variables
```

### execution model

initialization:
```
bp_stack = {0}
ra_stack = {}
fn_stack = {0}
pc = 1
```
execution loop:
```
while not halted:
    instruction = imem[pc]
    execute(instruction)
    if not branched:
        pc = pc + 1
```

### calling convention

parameter passing (caller with frame size N):
- parameter 0: `[N, 0]`
- parameter 1: `[N, 1]`
- parameter n: `[N, n]`

pass by value: use `mov [N, n] [i,j]` to copy nth parameter.

pass by reference: use `ptr [N, n] [i,j]` to pass pointer as nth parameter.

parameter access (callee):
- parameter 0: `[0, 0]`
- parameter 1: `[0, 1]`
- parameter n: `[0, n]`

return value (callee):
- return value: `[0, n]` for some designated column n

return value access (caller with frame size N):
- return value: `[N, n]` after call returns

### stack frames

when main (frame size 2) calls f (frame size 3), which in turn calls g (frame size 4)
```
dmem rows 0-1:   main (bp=0)
dmem rows 2-4:   f (bp=2)
dmem rows 5-8:   g (bp=5)

bp_stack = {0, 2, 5}
ra_stack = {3, 102}
fn_stack = {0, 100, 200}
```

### stack traces
```
print(f"current: {name(fn_stack[top])} at pc={pc}")
for i in reversed(range(len(ra_stack))):
    print(f"  from {name(fn_stack[i])} at pc={ra_stack[i]-1}")
```
example output during factorial(3) execution:
```
current: fact at pc=109
  from fact at pc=106
  from fact at pc=106
  from main at pc=2
```

### examples

#### example 1: factorial
```
main:
imem[0]:  0                     // // frame size
imem[1]:  loadi [0,0] 5.0       // n = 5;
imem[2]:  mov [0,1] [0,0]       // param 0 = n;
imem[3]:  call 100              // fact(n);
imem[4]:  halt                  // result in [0,1]

fact:
imem[100]: 2                    // // frame size
imem[101]: loadi [1,0] 1.0      // temp = 1;
imem[102]: blt [0,0] [1,0] 114  // if (n < 1) goto base;
imem[103]: beq [0,0] [1,0] 114  // if (n == 1) goto base;
imem[104]: mov [2,0] [0,0]      // param 0 = n;
imem[105]: loadi [1,0] 1.0      // temp = 1;
imem[106]: sub [2,0] [1,0]      // param 0 = n - 1;
imem[107]: call 100             // fact(n-1);
imem[108]: loadi [0,1] 0.0      // result = 0;
imem[109]: add [0,1] [0,0]      // result = n;
imem[110]: mul [0,1] [2,1]      // result = n * fact(n-1);
imem[111]: ret                  // return result;
base:
imem[114]: loadi [0,1] 1.0      // result = 1;
imem[115]: ret                  // return result;
```

#### example 2: prefix sum
```
main:
imem[0]:  2                     // // frame size
imem[1]:  loadi [0,0] 10.0      // array[0] = 10;
imem[2]:  loadi [0,1] 20.0      // array[1] = 20;
imem[3]:  loadi [0,2] 30.0      // array[2] = 30;
imem[4]:  loadi [0,3] 40.0      // array[3] = 40;
imem[5]:  loadi [0,4] 50.0      // array[4] = 50;
imem[6]:  loadi [0,5] 60.0      // array[5] = 60;
imem[7]:  loadi [0,6] 70.0      // array[6] = 70;
imem[8]:  loadi [0,7] 80.0      // array[7] = 80;
imem[9]:  loadi [0,8] 90.0      // array[8] = 90;
imem[10]: loadi [0,9] 100.0     // array[9] = 100;
imem[11]: ptr [2,0] [0,0]       // param 0 = &array[0];
imem[12]: loadi [2,1] 10.0      // param 1 = 10;
imem[13]: call 100              // prefix_sum(ptr, len);
imem[14]: halt

prefix_sum:
imem[100]: 3                    // // frame size
imem[101]: loadi [1,0] 1.0      // i = 1;
imem[102]: mov [2,0] [0,0]      // prev = arr_ptr;
imem[103]: mov [2,1] [0,0]      // curr = arr_ptr;
imem[104]: loadi [1,1] 1.0      // temp = 1;
imem[105]: ptradd [2,1] [1,1]   // curr++;
loop:
imem[106]: add [[2,1]] [[2,0]]  // *curr += *prev;
imem[107]: loadi [1,1] 1.0      // temp = 1;
imem[108]: ptradd [2,0] [1,1]   // prev++;
imem[109]: ptradd [2,1] [1,1]   // curr++;
imem[110]: add [1,0] [1,1]      // i++;
imem[111]: blt [1,0] [0,1] 106  // if (i < len) goto loop;
imem[112]: ret
```

## chapter 3 - the game 
[to be completed]

---

## my visual computing playground
[navier-stokes](https://galmungral.github.io/FVM-CFD/)
[frankot-chellappa](https://galmungral.github.io/dem-reconstruction/)
[path rendering](https://galmungral.github.io/newton-vg/) 
[volumetric path tracing](https://galmungral.github.io/visible-human-volume/)
[recursive ray tracing](https://galmungral.github.io/gl-raytracer/)
[cylindrical map projection](https://galmungral.github.io/mercator-3d/)
[hillshading](https://galmungral.github.io/hillshade/) 
[terrain](https://galmungral.github.io/terrain-generator/)
[2d waves](https://galmungral.github.io/fdm-2d/)
[3d waves](https://galmungral.github.io/fdm-3d/)
[ct slices](https://galmungral.github.io/visible-human-gl/) 
[particles](https://galmungral.github.io/particle-effects/)
[mesh distortion](https://galmungral.github.io/S2-graph/)
[ball-and-stick](https://galmungral.github.io/mol-renderer) 
