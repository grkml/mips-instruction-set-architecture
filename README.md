# MIPS Instruction Set Architecture Overview
ISA (Instruction Set Architecture) refers to the layers of abstraction between the software and the hardware. The ISA allows higher level programming languages to control low level hardware. It consists of and assembly language with human readable instructions that compiles down to binary machine code with CPU readable instructions.

<p align="center">
  <img width="45%" src="https://github.com/gurkamalpsc/mips-instruction-set-architecture/blob/master/img/structure.gif">
</p>

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

| Operation     | MIPS Instruction      | Higher Order Language Equivalent  |
| :------------- | :-------------| :-----|
| addition      | ```add $s1,$s2,$s3``` | ```$s1 = $s2 + $s3``` |
| subtraction   |  ```sub $s1,$s2,$s3``` | ```$s1 = $s2 – $s3``` |
| immediate addition   |  ```addi $s1,$s2,75``` | ```$s1 = $s2 + 75``` |
| and |  ```and $s1,$s2,$s3``` | ```$s1 = $s2 & $s3``` |
| or |    ```or $s1,$s2,$s3``` | ```$s1 = $s2 \| $s3``` |
| nor |     ```nor $s1,$s2,$s3``` | ```$s1 = ~ ($s2 \| $s3)``` |

### Data Transfer
Of course the CPU's register memory system is small (with only 32 registers). So, data needs to be constantly stored to and loaded from RAM. Data transfer instructions occur in the background in between data operation instructions. Here are a few examples:

| Operation     | MIPS Instruction           | Higher Order Language Equivalent  |
| :------------- | :-------------| :-----|
| load word      | ```lw $s1,20($s2)``` | ```$s1 = Memory[$s2 + 20]``` |
| store word   |  ```sw $s1,20($s2)``` | ```Memory[$s2 + 20] = $s1``` |

### Sequencing
Sequencing instructions make decisions and change the control flow of the program. They control the flow by telling the execution sequence to jump to some ```Label```, a portion of the MIPS Assembly Language marked with that ```Label```.

| Operation     | MIPS Instruction      | Higher Order Language Equivalent  |
| :------------- | :-------------| :-----|
| if branch on equal, jump to branch at ```Label```...      | ```beq $s1,$s2,Label``` | ```if ($s1 == $s2) { Label(); }``` |
| if branch on not equal, jump to branch at ```Label```...   |  ```bne $s1,$s2,Label``` | ```if ($s1 != $s2) { Label(); }``` |
| jump to ```Label```   |  ```j Label``` | ```Label();``` |

##### Higher Level Language Example (Java)

```cpp
// i, j, and k, are all ints

if (i == j) {
  h = i + j;
} else {
  h = i - j;
}
```

##### MIPS Assembly Language Example

```asm
# Registers to keep note of: $s1 stores i, $s2 stores j, $s3 stores h

Main:
  bne $s1, $s2, DoElse
  add $s3, $s1, $s2
  j SkipElse
Do Else:
  sub $s3, $s1, $s2
SkipElse:
  ### rest of code

```

## Machine Code Representation
Remember, assembly language itself is still an abstraction away from the language the CPU actually understands...binary machine code!

<p align="center">
  <img width="100%" src="https://github.com/gurkamalpsc/mips-instruction-set-architecture/blob/master/img/machineCode.jpg">
</p>

##### Higher Level Language Example (JavaScript)

```js
const reg9 = reg11 - 3;
```

##### MIPS Assembly Language Instruction

```asm
addi        $9, $11, -3
```

##### Machine Code Instruction

```binary
00100001011010011111111111111101
```
