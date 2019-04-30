# MIPS Instruction Set Architecture
## The Format of CPU Instructions
In general, MIPS instructions follow a 3-operand format, which states do the ```operation``` on ```source1``` and ```source2``` and store the result in ```destination```. The ```destination```, ```source1```, and ```source2``` can be thought of as a variable namse in a typical programming language. On the assembly language level, however, the data in these variables gets stored on locations in the CPU called registers. In a MIPS CPU there are 32 possible registers that can hold data from a programming language variable.

MIPS Assmebly Lanuage:
```
operation       destination, source1, source2
```

General Higher Level Programming Language:
```
destination  =  source1   operation   source2
```

## Types of Instructions
### Data Operation
Data operation instructions are what we think of when we write programming statements. They can be mathematical operaitons such addition and subtraction or logical operations such as < > == !=. Here are a few examples:

| Operation     | MIPS Instruction           | Higher Order Language Equivalent  |
| ------------- |-------------| -----|
| addition      | ```add    $s1,$s2,$s3``` | ```$s1 = $s2 + $s3``` |
| subtraction   |  ```sub    $s1,$s2,$s3``` | ```$s1 = $s2 – $s3``` |
| immediate addition   |  ```addi   $s1,$s2,75``` | ```$s1 = $s2 + 75``` |
| and |  ```and    $s1,$s2,$s3``` | ```$s1 = $s2 & $s3``` |
| or |    ```or     $s1,$s2,$s3``` | ```$s1 = $s2 \| $s3``` |
| nor |     ```nor    $s1,$s2,$s3``` | ```$s1 = ~ ($s2 \| $s3)``` |

### Data Transfer
Of course the CPU's register memory system is small (with only 32 registers). So, data needs to be constantly stored to and loaded from RAM. Data transfer instructions occur in the background in between data operation instructions. Here are a few examples:

| Operation     | MIPS Instruction           | Higher Order Language Equivalent  |
| ------------- |-------------| -----|
| addition      | ```add R1, R2, R3``` | ```R1 = R2 + R3``` |
| subtraction   |  ```sub R1, R2, R3``` | ```R1 = R2 - R3``` |
| and |  ```and $s1,$s2,$s3``` | ```$s1 = $s2 & $s3``` |
| or |    ```or $s1,$s2,$s3``` | ```$s1 = $s2 \| $s3``` |
| nor |     ```nor $s1,$s2,$s3``` | ```$s1 = ~ ($s2 \| $s3)``` |
### Sequencing
