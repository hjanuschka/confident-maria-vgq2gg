# Rust程序设计语言/Rust 权威指南

此文件为阅读[《Rust程序设计语言》中文版]([Rust 程序设计语言 - Rust 程序设计语言 中文版 (rustwiki.org)](https://rustwiki.org/zh-CN/book/title-page.html))后，摘抄的部分内容。

## 变量和可变性

#### 变量

- **默认**情况下变量是**不可变的**（*immutable*)。
- 当变量不可变时，意味着一个值绑定到一个变量名后，就不能更改值了。
- 通过在变量名前面加上 **`mut`** 可使得可变。 

#### 常量(constant)

- 常量是绑定到一个常量名且**不允许更改**的值，不允许使用  **`mmt`**，自始至终不可变。
- 常量的命名约定是全部字母都使用**大写**，并使用下划线分隔单词。
- 常量使用  **`const`** 关键字来声明，并且值的类型必须注明。
- 常量可以在任意作用域内声明，包括全局作用域。
- 常量只能设置为常量表达式：
  - 不能是函数调用的结果。
  - 可以是在运行时计算得到的值。

*将整个程序中用到的硬编码（hardcode）值命名为常量，对于将该值的含义传达给代码的未来维护者很有用。*

#### 遮蔽(shadow)

- 声明和前面变量具有相同名称的新变量，称之为变量**遮蔽**。
- *使用 `mut` 不能修改变量的类型，变量遮蔽可以让我们不必给出不同的名称，进行变量类型的修改。*



## 数据类型

### 标量(scalar)类型

- 标量类型表示单个值。Rust有4个基本的标量类型。
  - 整型
  - 浮点型
  - 布尔型
  - 字符

#### 整数(integer)类型

- 整数是没有小数部分的数字

- **有符号**和**无符号**表示数字能否取负数。

- 有符号数字以二进制补码形式存储。

  |     数字字面量     |     示例      |
  | :----------------: | :-----------: |
  |       十进制       |   `98_222`    |
  |      十六进制      |    `0xff`     |
  |       八进制       |    `0o77`     |
  |       二进制       | `0b1111_0000` |
  | 字节(仅限于 `u8` ) |    `b'A'`     |

  ------

  ##### 整型溢出

  比方说有一个 `u8` ，它可以存放从 0 到 255 的值。那么当你将其修改为范围之外的值，比如 256，则会发生**整型溢出**（*integer overflow*），这会导致两种行为的其中一种。当在调试（debug）模式编译时，Rust 会检查整型溢出，若存在这些问题则使程序在编译时 *panic*（恐慌）。Rust 使用 panic 这个术语来表明程序因错误而退出。

  在当使用 `--release` 参数进行发布（release）模式构建时，Rust **不**检测会导致 panic 的整型溢出。相反当检测到整型溢出时，Rust 会进行一种被称为二进制补码包裹（*two’s complement wrapping*）的操作。简而言之，大于该类型最大值的数值会被“包裹”成该类型能够支持的对应数字的最小值。比如在 `u8` 的情况下，256 变成 0，257 变成 1，依此类推。程序不会 panic，但是该变量的值可能不是你期望的值。依赖整型溢出包裹的行为不是一种正确的做法。

  要显式处理溢出的可能性，可以使用标准库针对原始数字类型提供的以下一系列方法：

  - 使用 `wrapping_*` 方法在所有模式下进行包裹，例如 `wrapping_add`
  - 如果使用 `checked_*` 方法时发生溢出，则返回 `None` 值
  - 使用 `overflowing_*` 方法返回该值和一个指示是否存在溢出的布尔值
  - 使用 `saturating_*` 方法使值达到最小值或最大值

#### 浮点类型

- 浮点数（*floating-point number*）是带有小数点的数字。
- Rust 的浮点型是 `f32` 和 `f64`，它们的大小分别为 32 位和 64 位。默认浮点类型是 `f64`

#### 数字运算

- 基本数学运算：加法、减法、乘法、除法和取模运算。

  ```rust
  fn main() {
      // addition
      let sum = 5 + 10;
  
      // subtraction
      let difference = 95.5 - 4.3;
  
      // multiplication
      let product = 4 * 30;
  
      // division
      let quotient = 56.7 / 32.2;
      let floored = 2 / 3; // Results in 0
  
      // remainder
      let remainder = 43 % 5;
  }
  
  ```

  ##### 运算符

  | 运算符 | 示例                                             | 解释                   | 是否可重载     |
  | ------ | ------------------------------------------------ | ---------------------- | -------------- |
  | `!`    | `ident!(...)`, `ident!{...}`, `ident![...]`      | 宏展开                 |                |
  | `!`    | `!expr`                                          | 按位非或逻辑非         | `Not`          |
  | `!=`   | `var != expr`                                    | 不等比较               | `PartialEq`    |
  | `%`    | `expr % expr`                                    | 算术取模               | `Rem`          |
  | `%=`   | `var %= expr`                                    | 算术取模与赋值         | `RemAssign`    |
  | `&`    | `&expr`, `&mut expr`                             | 借用                   |                |
  | `&`    | `&type`, `&mut type`, `&'a type`, `&'a mut type` | 借用指针类型           |                |
  | `&`    | `expr & expr`                                    | 按位与                 | `BitAnd`       |
  | `&=`   | `var &= expr`                                    | 按位与及赋值           | `BitAndAssign` |
  | `&&`   | `expr && expr`                                   | 逻辑与                 |                |
  | `*`    | `expr * expr`                                    | 算术乘法               | `Mul`          |
  | `*=`   | `var *= expr`                                    | 算术乘法与赋值         | `MulAssign`    |
  | `*`    | `*expr`                                          | 解引用                 |                |
  | `*`    | `*const type`, `*mut type`                       | 裸指针                 |                |
  | `+`    | `trait + trait`, `'a + trait`                    | 复合类型限制           |                |
  | `+`    | `expr + expr`                                    | 算术加法               | `Add`          |
  | `+=`   | `var += expr`                                    | 算术加法与赋值         | `AddAssign`    |
  | `,`    | `expr, expr`                                     | 参数以及元素分隔符     |                |
  | `-`    | `- expr`                                         | 算术取负               | `Neg`          |
  | `-`    | `expr - expr`                                    | 算术减法               | `Sub`          |
  | `-=`   | `var -= expr`                                    | 算术减法与赋值         | `SubAssign`    |
  | `->`   | `fn(...) -> type`, `|...| -> type`               | 函数与闭包，返回类型   |                |
  | `.`    | `expr.ident`                                     | 成员访问               |                |
  | `..`   | `..`, `expr..`, `..expr`, `expr..expr`           | 右排除范围             |                |
  | `..`   | `..expr`                                         | 结构体更新语法         |                |
  | `..`   | `variant(x, ..)`, `struct_type { x, .. }`        | “与剩余部分”的模式绑定 |                |
  | `...`  | `expr...expr`                                    | 模式: 范围包含模式     |                |
  | `/`    | `expr / expr`                                    | 算术除法               | `Div`          |
  | `/=`   | `var /= expr`                                    | 算术除法与赋值         | `DivAssign`    |
  | `:`    | `pat: type`, `ident: type`                       | 约束                   |                |
  | `:`    | `ident: expr`                                    | 结构体字段初始化       |                |
  | `:`    | `'a: loop {...}`                                 | 循环标志               |                |
  | `;`    | `expr;`                                          | 语句和语句结束符       |                |
  | `;`    | `[...; len]`                                     | 固定大小数组语法的部分 |                |
  | `<<`   | `expr << expr`                                   | 左移                   | `Shl`          |
  | `<<=`  | `var <<= expr`                                   | 左移与赋值             | `ShlAssign`    |
  | `<`    | `expr < expr`                                    | 小于比较               | `PartialOrd`   |
  | `<=`   | `expr <= expr`                                   | 小于等于比较           | `PartialOrd`   |
  | `=`    | `var = expr`, `ident = type`                     | 赋值/等值              |                |
  | `==`   | `expr == expr`                                   | 等于比较               | `PartialEq`    |
  | `=>`   | `pat => expr`                                    | 匹配准备语法的部分     |                |
  | `>`    | `expr > expr`                                    | 大于比较               | `PartialOrd`   |
  | `>=`   | `expr >= expr`                                   | 大于等于比较           | `PartialOrd`   |
  | `>>`   | `expr >> expr`                                   | 右移                   | `Shr`          |
  | `>>=`  | `var >>= expr`                                   | 右移与赋值             | `ShrAssign`    |
  | `@`    | `ident @ pat`                                    | 模式绑定               |                |
  | `^`    | `expr ^ expr`                                    | 按位异或               | `BitXor`       |
  | `^=`   | `var ^= expr`                                    | 按位异或与赋值         | `BitXorAssign` |
  | `|`    | `pat | pat`                                      | 模式选择               |                |
  | `|`    | `expr | expr`                                    | 按位或                 | `BitOr`        |
  | `|=`   | `var |= expr`                                    | 按位或与赋值           | `BitOrAssign`  |
  | `||`   | `expr || expr`                                   | 逻辑或                 |                |
  | `?`    | `expr?`                                          | 错误传播               |                |

#### 布尔类型

- Rust 中的布尔类型有两个可能的值：`true` 和 `false`。
- *使用布尔值的主要地方是条件判断。*

#### 字符(char)类型

- Rust 的 `char`（字符）类型是该语言最基本的字母类型。

- Rust 的字符类型大小为**4 个字节**，表示的是一个 Unicode 标量值。

- 声明的 `char` 字面量采用单引号括起来。

- *与字符串字面量不同，字符串字面量是用双引号括起来。*

  ```rust
  fn main() {
      let c = 'z';
      let z = 'ℤ';
      let heart_eyed_cat = '😻';
  }
  ```

  

### 复合类型(compound type)

*两种基本的复合类型：元组 (tuple) 和数组 (array) 。*

#### 元组类型

- **元组的长度是固定的，声明后就无法增长或缩小**。

- **元组的每个元素不要求具有相同的类型**。

  ------

  *小括号内写入以逗号分隔的值列表来创建一个元组*

  ```rust
  fn main() {
      // 显式声明值类型
      let tup: (i32, f64, u8) = (500, 6.4, 1);
  }
  ```

  变量 `tup` 绑定到整个元组，因为元组被认作是单个复合元素。 想从元组中获取个别值，我们可以使用模式匹配来解构（destructure）元组的一个值，如下所示：

  ```rust
  fn main() {
      // 隐式声明值类型，编译器会自动推断类型
      let tup = (500, 6.4, 1);
  
      let (x, y, z) = tup;
  
      println!("The value of y is: {}", y);
  }
  ```

  该程序首先创建一个元组并将其绑定到变量 `tup` 上。 然后它借助 `let` 来使用一个模式匹配 `tup`，并将它分解成三个单独的变量 `x`、`y` 和 `z`。 这过程称为**解构**（*destructuring*），因为它将单个元组分为三部分。最后，程序打印出 `y` 值，为 `6.4`。

  ```rust
  fn main() {
      let x: (i32, f64, u8) = (500, 6.4, 1);
  
      let five_hundred = x.0;
  
      let six_point_four = x.1;
  
      let one = x.2;
  }
  ```

  该程序创建一个元组 `x`，然后通过使用它们的索引为每个元素创建新的变量。和大多数编程语言一样，元组中的第一个索引为 0。

  没有任何值的元组 `()` 是一种特殊的类型，只有一个值，也写成 `()`。该类型被称为**单元类型**（*unit type*），该值被称为**单元值**（*unit value*）。如果表达式不返回任何其他值，就隐式地返回单元值。*

#### 数组类型

- **数组的每个元素必须具有相同的类型**。

- **数组具有固定长度**。

  *方括号内以逗号分隔的列表形式将值写到数组中：*

  ```rust
  fn main() {
      let a = [1, 2, 3, 4, 5];
  }
  ```

  当你希望将数据分配到栈（stack）而不是堆（heap）时，或者当你希望确保始终具有固定数量的元素时，数组特别有用。

  不过当你明确元素数量不需要改变时，数组会更有用。例如，如果你在程序中使用月份的名称，你很可能希望使用的是数组而不是 vector，因为你知道它始终包含 12 个元素：

  ```rust
  let months = ["January", "February", "March", "April", "May", "June", "July",
                "August", "September", "October", "November", "December"];
  ```

  使用方括号编写数组的类型，其中包含每个元素的类型、分号，然后是数组中的元素数，如下所示：

  ```rust
  // i32 是每个元素的类型。分号之后，数字 5 表明该数组包含 5 个元素。
  let a: [i32; 5] = [1, 2, 3, 4, 5];
  ```

  如果要**为每个元素创建包含相同值的数组**，可以指定初始值，后跟分号，然后在方括号中指定数组的长度，如下所示：

  ```rust
  // 变量名为 a 的数组将包含 5 个元素，这些元素的值初始化为 3。
  let a = [3; 5];	// a = [3, 3, 3, 3, 3]; 
  ```

  ##### 访问数组元素

  **数组是可以在栈(stack)上分配的已知固定大小的单个内存块**。可以使用索引访问数组的元素，如下所示：

  ```rust
  fn main() {
      let a = [1, 2, 3, 4, 5];
      // first 的变量将获得值 1，因为它是数组中索引 [0] 处的值。
      let first = a[0];
      //  second 的变量将从数组中的索引 [1] 中获取得 2。
      let second = a[1];
  }
  ```

  ##### 无效的数组元素访问

  *当你尝试使用索引访问元素时，Rust 将检查你指定的索引是否小于数组长度。如果索引大于或等于数组长度，Rust 会出现 `panic`。*



## 函数

- `fn` 关键字，它用来声明新函数，后跟着函数名和一对圆括号。
- Rust 代码中的函数和变量名使用下划线命名法（*snake case*，直译为蛇形命名法）规范风格。
- 在下划线命名法中，所有字母都是小写并使用下划线分隔单词。

#### 参数

函数也可以被定义为拥有**参数**（*parameter*），参数是特殊变量，是函数签名的一部分。当函数拥有参数（形参）时，可以为这些参数提供具体的值（实参）。技术上讲，这些具体值被称为**实参**（*argument*），但是在日常交流中，人们倾向于不区分使用 *parameter* 和 *argument* 来表示函数定义中的变量或调用函数时传入的具体值。

在函数签名中，**必须**声明每个参数的类型。这是一个 Rust 设计中经过慎重考虑的决定：要求在函数定义中提供类型标注，意味着编译器几乎从不需要你在代码的其他地方注明类型来指出你的意图。

#### 语句和表达式

Rust 是一门基于表达式（expression-based）的语言，**函数体由一系列语句组成，也可选择以表达式结尾**。

**语句（*statement*）是执行一些操作但不返回值的指令。表达式（*expression*）计算并产生一个值**。让我们看一些例子：	

```rust
// 包含一个语句的 main 函数定义
fn main() {
    // 使用 let 关键字创建变量并绑定一个值是一个语句。
    let y = 6;
}
```

**函数定义也是语句**，上面整个例子本身就是一个语句。语句不返回值。因此，不能把 `let` 语句赋值给另一个变量。`x = y = 6`，**在Rust中不能这样子写**。

表达式会计算出一个值，并且你接下来要用 Rust 编写的大部分代码都由表达式组成。考虑一个数学运算，比如 `5 + 6`，这是一个表达式并计算出值 `11`。表达式可以是语句的一部分：在示例 3-1 中，语句 `let y = 6;` 中的 `6` 是一个表达式，它计算出的值是 `6`。**函数调用**是一个表达式。**宏调用**是一个表达式。我们用来创建新**作用域的大括号**（代码块） `{}` 也是一个表达式，例如：

```rust
fn main() {
    let y = {
        let x = 3;
        x + 1
    };

    println!("The value of y is: {}", y);
}
```

这个表达式：

```rust
{
    let x = 3;
    x + 1
}
```

是一个代码块，在这个例子中计算结果是 `4`。这个值作为 `let` 语句的一部分被绑定到 `y` 上。注意，`x + 1` 行的末尾没有分号，这与你目前见过的大部分代码行不同。表达式的结尾没有分号。如果在表达式的末尾加上分号，那么它就转换为语句，而语句不会返回值。在接下来探讨函数返回值和表达式时，请记住这一点。

#### 带返回值的函数

函数可以向调用它的代码返回值。我们并不对返回值命名，但要在箭头（`->`）后声明它的类型。在 Rust 中，函数的返回值等同于函数体最后一个表达式的值。使用 `return` 关键字和指定值，可以从函数中提前返回；但**大部分函数隐式返回最后一个表达式**。这是一个有返回值函数的例子：

```rust
// 在 `five` 函数中没有函数调用、宏，甚至没有 `let` 语句——只有数字 `5` 本身。这在 Rust 中是一个完全有效的函数。
fn five() -> i32 {
    5
}

fn main() {
    let x = five();

    println!("The value of x is: {}", x);
}
```

在 `five` 函数中没有函数调用、宏，甚至没有 `let` 语句——只有数字 `5` 本身。这在 Rust 中是一个完全有效的函数。注意，函数返回值的类型也被指定好，即 `-> i32`。

`five` 函数的返回值是 `5`，所以返回值类型是 `i32`。让我们仔细检查一下这段代码。有两个重要的部分：首先，`let x = five();` 这一行表明我们使用函数的返回值初始化一个变量。因为 `five` 函数返回 `5`，这一行与如下代码相同：

```rust
let x = 5;
```

其次，`five` 函数没有参数并定义了返回值类型，不过函数体只有单单一个 `5` 也没有分号，因为这是一个表达式，正是我们想要返回的值。

```rust
// 另一个例子
fn main() {
    let x = plus_one(5);

    println!("The value of x is: {}", x);
}

fn plus_one(x: i32) -> i32 {
    x + 1
}

// 运行代码会打印出 The value of x is: 6。但如果在包含 x + 1 的行尾加上一个分号，把它从表达式变成语句，我们将得到一个错误： error[E0308]: mismatched types
```

主要的错误信息 “**mismatched types**”（**类型不匹配**）揭示了这段代码的核心问题。函数 `plus_one` 的定义说明它要返回一个 `i32` 类型的值，不过语句并不会返回值，此值由单位类型 `()` 表示，表示不返回值。因为不返回值与函数定义相矛盾，从而出现一个错误。在输出中，Rust 提供了一条信息，可能有助于纠正这个错误：它建议删除分号，这将修复错误。



## 控制流

*Rust 代码中最常见的用来控制执行流的结构是 `if` 表达式和循环*。

### if 表达式

`if` 表达式允许根据条件执行不同的代码分支。

- true -> 运行。
- false -> 不运行。
- 代码中的条件**必须**是 `bool` 值。

```rust
fn main() {
    let number = 3;

    if number != 0 {
        println!("number was something other than zero");
    }
}

// 运行代码会打印出 number was something other than zero。
```

#### 使用else if 处理多重条件

```rust
fn main() {
    let number = 6;

    if number % 4 == 0 {
        println!("number is divisible by 4");
    } else if number % 3 == 0 {
        println!("number is divisible by 3");
    } else if number % 2 == 0 {
        println!("number is divisible by 2");
    } else {
        println!("number is not divisible by 4, 3, or 2");
    }
}

// 运行代码会打印出 number is divisible by 3。
```

当执行这个程序时，它按顺序检查每个 `if` 表达式并执行第一个条件为真的代码块。注意即使 6 可以被 2 整除，也不会输出 `number is divisible by 2`，更不会输出 `else` 块中的 `number is not divisible by 4, 3, or 2`。原因是 **Rust 只会执行第一个条件为真的代码块**，并且一旦它找到一个以后，甚至都不会检查剩下的条件了。

#### 在 let 语句中使用 if

因为 `if` 是一个表达式，我们可以在 `let` 语句的右侧使用它来将结果赋值给一个变量。**代码块的值是其最后一个表达式的值，而数字本身就是一个表达式**，整个 `if` 表达式的值取决于哪个代码块被执行。这意味着 `if` 的每个分支的可能的返回值都必须是**相同类型**。

```rust
fn main() {
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!("The value of number is: {}", number);
}

// 运行代码会打印出 The value of number is: 5。
```

#### 使用循环重复执行

*多次执行同一段代码是很常用的，Rust 为此提供了多种**循环**（*loop*），它们遍历执行循环体中的代码直到结尾并紧接着回到开头继续执行。*

- `loop`
- `while`
- `for`

##### 使用loop重复执行代码

`loop` 关键字告诉 Rust 一遍又一遍地执行一段代码直到你明确要求停止。

```rust
fn main() {
    loop {
        println!("again!");
    }
}

// 当运行这个程序时，我们会看到连续的反复打印 again!
```

-  `break` 关键字来告诉程序何时停止循环。
- `continue`关键字告诉程序跳过这个循环迭代中的任何剩余代码，并转到下一个迭代。

如果存在嵌套循环，`break` 和 `continue` 应用于此时最内层的循环。你可以选择在一个循环上指定一个**循环标签**（*loop label*），然后将标签与 `break` 或 `continue` 一起使用，使这些关键字应用于已标记的循环而不是最内层的循环。下面是一个包含两个嵌套循环的示例：

```rust
fn main() {
    let mut count = 0;
    'counting_up: loop {
        println!("count = {}", count);
        let mut remaining = 10;

        loop {
            println!("remaining = {}", remaining);
            if remaining == 9 {
                break;
            }
            if count == 2 {
                break 'counting_up;
            }
            remaining -= 1;
        }

        count += 1;
    }
    println!("End count = {}", count);
}

```

外层循环有一个标签 `counting_up`，它将从 0 数到 2。没有标签的内部循环从 10 向下数到 9。第一个没有指定标签的 `break` 将只退出内层循环。`break 'counting_up;` 语句将退出外层循环。这个代码打印：

```sh
$ cargo run
   Compiling loops v0.1.0 (file:///projects/loops)
    Finished dev [unoptimized + debuginfo] target(s) in 0.58s
     Running `target/debug/loops`
count = 0
remaining = 10
remaining = 9
count = 1
remaining = 10
remaining = 9
count = 2
remaining = 10
End count = 2
```

##### 从循环返回

`loop` 的一个用例是重试可能会失败的操作，比如检查线程是否完成了任务。然而你可能会需要将操作的结果从循环中传递给其它的代码。为此，你可以在用于停止循环的 `break` 表达式添加你想要返回的值；该值将从循环中返回，以便您可以使用它，如下所示：

```rust
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!("The result is {}", result);
}

// 运行代码会打印出 The result is: 20。
```

在循环之前，我们声明了一个名为 `counter` 的变量并初始化为 `0`。接着声明了一个名为 `result` 来存放循环的返回值。在循环的每一次迭代中，我们将 `counter` 变量加 `1`，接着检查计数是否等于 `10`。当相等时，使用 `break` 关键字返回值 `counter * 2`。循环之后，我们通过分号结束赋值给 `result` 的语句。最后打印出 `result` 的值，也就是 20。

### while条件循环

这种结构消除了很多使用 `loop`、`if`、`else` 和 `break` 时所必须的嵌套，这样更加清晰。**当条件为真就执行，否则退出循环**。

```rust
// 示例 3-3
fn main() {
    let mut number = 3;

    while number != 0 {
        println!("{}!", number);

        number -= 1;
    }

    println!("LIFTOFF!!!");
}
```

可以使用 `while` 结构来遍历集合中的元素，比如数组。循环打印数组 `a` 中的每个元素，如下所示：

```rust
// 示例 3-4
fn main() {
    let a = [10, 20, 30, 40, 50];
    let mut index = 0;

    while index < 5 {
        println!("the value is: {}", a[index]);

        index += 1;
    }
}
```

在这里，代码对数组中的元素进行计数。它从索引 `0` 开始，并接着循环直到遇到数组的最后一个索引（即 `index < 5` 不再为真时）。运行这段代码会打印出数组中的每一个元素：

```sh
$ cargo run
   Compiling loops v0.1.0 (file:///projects/loops)
    Finished dev [unoptimized + debuginfo] target(s) in 0.32s
     Running `target/debug/loops`
the value is: 10
the value is: 20
the value is: 30
the value is: 40
the value is: 50
```

数组中的 5 个元素全部都如期被打印出来。尽管 `index` 在某一时刻会到达值 `5`，不过循环在其尝试从数组获取第 6 个值（会越界）之前就停止了。但是这个过程很容易出错；如果索引值或测试条件不正确会导致程序 panic。例如，如果将 `a` 数组的定义更改为包含 4 个元素，但忘记将条件更新为`while index < 4`，则代码会出现 panic。这也使程序更慢，因为编译器增加了运行时代码来对每次循环进行条件检查，以确定在循环的每次迭代中索引是否在数组的边界内。`for` 循环来对一个集合的每个元素执行一些代码是更简洁的替代方案。

### for遍历集合

```rust
// 使用 for 循环遍历集合中的元素
fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a {
        println!("the value is: {}", element);
    }
}
```

当运行这段代码时，将看到与示例 3-4 一样的输出。更为重要的是，我们增强了代码安全性，并消除了可能由于超出数组的结尾或遍历长度不够而缺少一些元素而导致的 bug。使用 `for` 循环的话，就不需要惦记着在改变数组元素个数时修改其他的代码了，就像使用示例 3-4 中使用的方法一样。`for` 循环的安全性和简洁性使得它成为 Rust 中使用最多的循环结构。即使是在想要循环执行代码特定次数时，例如示例 3-3 中使用 `while` 循环的倒计时例子，大部分 Rustacean 也会使用 `for` 循环。这么做的方式是使用 `Range`，它是标准库提供的类型，用来生成从一个数字开始到另一个数字之前结束的所有数字的序列。

下面是一个使用 `for` 循环来倒计时的例子，它还使用了一个我们还未讲到的方法，`rev`，用来反转区间（range）:

```rust
// 这段代码更好一些，不是吗？
fn main() {
    for number in (1..4).rev() {
        println!("{}!", number);
    }
    println!("LIFTOFF!!!");
}
```



## 所有权

Rust 的核心功能（之一）是 **所有权**（*ownership*）。虽然该功能很容易解释，但它对语言的其他部分有着深刻的影响。所有运行的程序都必须管理其使用计算机内存的方式。一些语言中具有垃圾回收机制，在程序运行时不断地寻找不再使用的内存；在另一些语言中，开发者必须亲自分配和释放内存。Rust 则选择了第三种方式：通过所有权系统管理内存，编译器在编译时会根据一系列的规则进行检查。在运行时，所有权系统的任何功能都不会减慢程序。

**栈（Stack） 与堆（Heap）**

```matlab
在很多语言中，你并不需要经常考虑到栈与堆。不过在像 Rust 这样的系统编程语言中，值是位于栈上还是堆上在更大程度上影响了语言的行为以及为何必须做出这样的抉择。我们会在本章的稍后部分描述所有权与栈和堆相关的内容，所以这里只是一个用来预热的简要解释。

栈和堆都是代码在运行时可供使用的内存，但是它们的结构不同。栈以放入值的顺序存储值并以相反顺序取出值。这也被称作 后进先出（last in, first out）。想象一下一叠盘子：当增加更多盘子时，把它们放在盘子堆的顶部，当需要盘子时，也从顶部拿走。不能从中间也不能从底部增加或拿走盘子！增加数据叫做 进栈（pushing onto the stack），而移出数据叫做 出栈（popping off the stack）。

栈中的所有数据都必须占用已知且固定的大小。在编译时大小未知或大小可能变化的数据，要改为存储在堆上。堆是缺乏组织的：当向堆放入数据时，你要请求一定大小的空间。内存分配器（memory allocator）在堆的某处找到一块足够大的空位，把它标记为已使用，并返回一个表示该位置地址的 指针（pointer）。这个过程称作 在堆上分配内存（allocating on the heap），有时简称为 “分配”（allocating）。将数据推入栈中并不被认为是分配。因为指针的大小是已知并且固定的，你可以将指针存储在栈上，不过当需要实际数据时，必须访问指针。

想象一下去餐馆就座吃饭。当进入时，你说明有几个人，餐馆员工会找到一个够大的空桌子并领你们过去。如果有人来迟了，他们也可以通过询问来找到你们坐在哪。

入栈比在堆上分配内存要快，因为（入栈时）分配器无需为存储新数据去搜索内存空间；其位置总是在栈顶。相比之下，在堆上分配内存则需要更多的工作，这是因为分配器必须首先找到一块足够存放数据的内存空间，并接着做一些记录为下一次分配做准备。

访问堆上的数据比访问栈上的数据慢，因为必须通过指针来访问。现代处理器在内存中跳转越少就越快（缓存）。继续类比，假设有一个服务员在餐厅里处理多个桌子的点菜。在一个桌子报完所有菜后再移动到下一个桌子是最有效率的。从桌子 A 听一个菜，接着桌子 B 听一个菜，然后再桌子 A，然后再桌子 B 这样的流程会更加缓慢。出于同样原因，处理器在处理的数据彼此较近的时候（比如在栈上）比较远的时候（比如可能在堆上）能更好的工作。在堆上分配大量的空间也可能消耗时间。

当你的代码调用一个函数时，传递给函数的值（包括可能指向堆上数据的指针）和函数的局部变量被压入栈中。当函数结束时，这些值被移出栈。

跟踪哪部分代码正在使用堆上的哪些数据，最大限度地减少堆上的重复数据量，以及清理堆上不再使用的数据确保不会耗尽空间，这些问题正是所有权系统要处理的。一旦理解了所有权，你就不需要经常考虑栈和堆了，不过明白了所有权的存在就是为了管理堆数据，能够帮助解释为什么所有权要以这种方式工作。
```

#### 所有权规则

- Rust 中的每一个值都有一个被称为其 **所有者**（*owner*）的变量。
- 值在任一时刻有且只有一个所有者。
- 当所有者（变量）离开作用域，这个值将被丢弃。

##### 变量作用域

在所有权的第一个例子中，我们看看一些变量的 **作用域**（*scope*）。作用域是一个项（item）在程序中有效的范围。假设有这样一个变量：

```rust
let s = "hello";
```

变量 `s` 绑定到了一个字符串字面量，这个字符串值是硬编码进程序代码中的。该变量从声明的那一刻开始直到当前 **作用域** 结束时都是有效的。示例 4-1 的注释标明了变量 `s` 的有效范围。

```rust
// 一个变量和其有效的作用域
fn main() {
    {                      // s 在这里无效, 它尚未声明
        let s = "hello";   // 从此处起，s 开始有效

        // 使用 s
    }                      // 此作用域已结束，s 不再有效
}
```

换句话说，这里有两个重要的时间点：

- 当 `s` **进入作用域** 时，它就是有效的。
- 这一直持续到它 **离开作用域** 为止。

目前为止，变量是否有效与作用域的关系跟其他编程语言是类似的。现在我们在此基础上介绍 `String` 类型。

###### String类型

前面介绍的类型都是已知大小的，可以存储在栈中，并且当离开作用域时被移出栈，如果代码的另一部分需要在不同的作用域中使用相同的值，可以快速简单地复制它们来创建一个新的独立实例。不过我们需要寻找一个存储在堆上的数据来探索 Rust 是如何知道该在何时清理数据的。

这里使用 `String` 作为例子，并专注于 `String` 与所有权相关的部分。这些方面也同样适用于标准库提供的或你自己创建的其他复杂数据类型。

我们已经见过字符串字面量，即被硬编码进程序里的字符串值。字符串字面量是很方便的，不过它们并不适合使用文本的每一种场景。原因之一就是它们是不可变的。另一个原因是并非所有字符串的值都能在编写代码时就知道：例如，要是想获取用户输入并存储该怎么办呢？为此，Rust 有第二个字符串类型，`String`。这个类型管理被分配到堆上的数据，所以能够存储在编译时未知大小的文本。可以使用 `from` 函数基于字符串字面量来创建 `String`，如下：

```rust
let s = String::from("hello");
```

这两个冒号（`::`）是运算符，允许将特定的 `from` 函数置于 `String` 类型的命名空间（namespace）下，而不需要使用类似 `string_from` 这样的名字。

**可以** 修改此类字符串 ：

```rust
    let mut s = String::from("hello");

    s.push_str(", world!"); // push_str() 在字符串后追加字面值

    println!("{}", s); // 将打印 `hello, world!`
```

为什么 `String` 可变而字面量却不行呢？区别在于两个类型对内存的处理上。

#### 内存与分配

就字符串字面量来说，我们在编译时就知道其内容，所以文本被直接硬编码进最终的可执行文件中。这使得字符串字面量快速且高效。不过这些特性都只得益于字符串字面量的不可变性。不幸的是，我们不能为了每一个在编译时大小未知的文本而将一块内存放入二进制文件中，并且它的大小还可能随着程序运行而改变。

对于 `String` 类型，为了支持一个可变，可增长的文本片段，需要在堆上分配一块在编译时未知大小的内存来存放内容。这意味着：

- 必须在运行时向内存分配器请求内存。
- 需要一个当我们处理完 `String` 时将内存返回给分配器的方法。

第一部分由我们完成：当调用 `String::from` 时，它的实现（*implementation*）请求其所需的内存。这在编程语言中是非常通用的。

然而，第二部分实现起来就各有区别了。在有 **垃圾回收**（*garbage collector*，*GC*）的语言中， GC 记录并清除不再使用的内存，而我们并不需要关心它。没有 GC 的话，识别出不再使用的内存并调用代码显式释放就是我们的责任了，跟请求内存的时候一样。从历史的角度上说正确处理内存回收曾经是一个困难的编程问题。如果忘记回收了会浪费内存。如果过早回收了，将会出现无效变量。如果重复回收，这也是个 bug。我们需要精确地为一个 `allocate` 配对一个 `free`。

Rust 采取了一个不同的策略：内存在拥有它的变量离开作用域后就被自动释放。下面是示例 4-1 中作用域例子的一个使用 `String` 而不是字符串字面量的版本：

```rust
fn main() {
    {
        let s = String::from("hello"); // 从此处起，s 开始有效

        // 使用 s
    }                                  // 此作用域已结束，
                                       // s 不再有效
}
```

*注意：在 C++ 中，这种 item 在生命周期结束时释放资源的模式有时被称作 **资源获取即初始化**（*Resource Acquisition Is Initialization (RAII)*）。如果你使用过 RAII 模式的话应该对 Rust 的 `drop` 函数并不陌生。*

这是一个将 `String` 需要的内存返回给分配器的很自然的位置：当 `s` 离开作用域的时候。当变量离开作用域，Rust 为我们调用一个特殊的函数。这个函数叫做 [`drop`](https://rustwiki.org/zh-CN/std/ops/trait.Drop.html#tymethod.drop)，在这里 `String` 的作者可以放置释放内存的代码。Rust 在结尾的 `}` 处自动调用 `drop`。这个模式对编写 Rust 代码的方式有着深远的影响。现在它看起来很简单，不过在更复杂的场景下代码的行为可能是不可预测的，比如当有多个变量使用在堆上分配的内存时。现在让我们探索一些这样的场景。

##### 变量与数据交互的方式（一）：移动

在 Rust 中，多个变量能够以不同的方式与同一数据交互。

```rust
// 将变量 x 的整数值赋给 y
fn main() {
    let x = 5;
    let y = x;
}
```

我们大致可以猜到这在干什么：“将 `5` 绑定到 `x`；接着生成一个值 `x` 的拷贝并绑定到 `y`”。现在有了两个变量，`x` 和 `y`，都等于 `5`。这也正是事实上发生了的，因为整数是有已知固定大小的简单值，所以这两个 `5` 被放入了栈（stack）中。

现在看看这个 `String` 版本：

```rust
fn main() {
    let s1 = String::from("hello");
    let s2 = s1;
}
```

这看起来与上面的代码非常类似，所以我们可能会假设他们的运行方式也是类似的：也就是说，第二行可能会生成一个 `s1` 的拷贝并绑定到 `s2` 上。不过，事实上并不完全是这样。看看图 4-1 以了解 `String` 的底层会发生什么。

`String` 由三部分组成，如图左侧所示：一个指向存放字符串内容内存的指针，一个长度，和一个容量。这一组数据存储在栈上。右侧则是堆上存放内容的内存部分。如下所示：

![String in memory](https://rustwiki.org/zh-CN/book/img/trpl04-01.svg)

图 4-1：将值 `"hello"` 绑定给 `s1` 的 `String` 在内存中的表现形式

长度表示 `String` 的内容当前使用了多少字节的内存。容量是 `String` 从分配器总共获取了多少字节的内存。长度与容量的区别是很重要的，不过在当前上下文中并不重要，所以现在可以忽略容量。

当我们将 `s1` 赋值给 `s2`，`String` 的数据被复制了，这意味着我们从栈上拷贝了它的指针、长度和容量。我们并没有复制指针指向的堆上数据。换句话说，内存中数据的表现如图 4-2 所示。

![s1 and s2 pointing to the same value](https://rustwiki.org/zh-CN/book/img/trpl04-02.svg)

图 4-2：变量 `s2` 的内存表现，它有一份 `s1` 指针、长度和容量的拷贝

这个表现形式看起来 **并不像** 图 4-3 中的那样，如果 Rust 也拷贝了堆上的数据，那么内存看起来就是这样的。如果 Rust 这么做了，那么操作 `s2 = s1` 在堆上数据比较大的时候会对运行时性能造成非常大的影响。

![s1 and s2 to two places](https://rustwiki.org/zh-CN/book/img/trpl04-03.svg)

图 4-3：另一个 `s2 = s1` 时可能的内存表现，如果 Rust 同时也拷贝了堆上的数据的话

之前我们提到过当变量离开作用域后，Rust 自动调用 `drop` 函数并清理变量的堆内存。不过图 4-2 展示了两个数据指针指向了同一位置。这就有了一个问题：当 `s2` 和 `s1` 离开作用域，他们都会尝试释放相同的内存。这是一个叫做 **二次释放**（*double free*）的错误，也是之前提到过的内存安全性 bug 之一。两次释放（相同）内存会导致内存污染，它可能会导致潜在的安全漏洞。

为了确保内存安全，这种场景下 Rust 的处理有另一个细节值得注意。在 `let s2 = s1` 之后，Rust 认为 `s1` 不再有效，因此 Rust 不需要在 `s1` 离开作用域后清理任何东西。看看在 `s2` 被创建之后尝试使用 `s1` 会发生什么；这段代码不能运行：

```rust
fn main() {
    let s1 = String::from("hello");
    let s2 = s1;

    println!("{}, world!", s1);
}

// 代码运行时，将会产生错误：error[E0382]: borrow of moved value: `s1`，，因为 Rust 禁止你使用无效的引用。
```

如果你在其他语言中听说过术语 **浅拷贝**（*shallow copy*）和 **深拷贝**（*deep copy*），那么拷贝指针、长度和容量而不拷贝数据可能听起来像浅拷贝。不过因为 Rust 同时使第一个变量无效了，这个操作被称为 **移动**（*move*），而不是浅拷贝。上面的例子可以解读为 `s1` 被 **移动** 到了 `s2` 中。那么具体发生了什么，如图 4-4 所示。

![s1 moved to s2](https://rustwiki.org/zh-CN/book/img/trpl04-04.svg)

图 4-4：`s1` 无效之后的内存表现

这样就解决了我们的问题！因为只有 `s2` 是有效的，当其离开作用域，它就释放自己的内存，完毕。

另外，这里还隐含了一个设计选择：Rust 永远也不会自动创建数据的 “深拷贝”。因此，任何 **自动** 的复制可以被认为对运行时性能影响较小。

##### 变量与数据交互的方式（二）：克隆

如果我们 **确实** 需要深度复制 `String` 中堆上的数据，而不仅仅是栈上的数据，可以使用一个叫做 `clone` 的通用函数。第 5 章会讨论方法语法，不过因为方法在很多语言中是一个常见功能，所以之前你可能已经见过了。

```rust
// 这是一个实际使用 `clone` 方法的例子
fn main() {
    let s1 = String::from("hello");
    let s2 = s1.clone();

    println!("s1 = {}, s2 = {}", s1, s2);
}
```

这段代码能正常运行，并且明确产生图 4-3 中行为，这里堆上的数据 **确实** 被复制了。

当出现 `clone` 调用时，你知道一些特定的代码被执行而且这些代码可能相当消耗资源。你很容易察觉到一些不寻常的事情正在发生。

##### 只在栈上的数据：拷贝

这里还有一个没有提到的小窍门。这些代码使用了整型并且是有效的，他们是示例 4-2 中的一部分：

```rust
fn main() {
    let x = 5;
    let y = x;

    println!("x = {}, y = {}", x, y);
}
```

但这段代码似乎与我们刚刚学到的内容相矛盾：没有调用 `clone`，不过 `x` 依然有效且没有被移动到 `y` 中。

原因是像整型这样的**在编译时已知大小的类型被整个存储在栈上**，所以拷贝其实际的值是快速的。这意味着没有理由在创建变量 `y` 后使 `x` 无效。换句话说，这里没有深浅拷贝的区别，所以这里调用 `clone` 并不会与通常的浅拷贝有什么不同，我们可以不用管它。

Rust 有一个叫做 `Copy` trait 的特殊标注，可以用在类似整型这样的存储在栈上的类型上。如果一个类型实现了 `Copy` trait，那么一个旧的变量在将其赋值给其他变量后仍然可用。Rust 不允许自身或其任何部分实现了 `Drop` trait 的类型使用 `Copy` trait。如果我们对其值离开作用域时需要特殊处理的类型使用 `Copy` 标注，将会出现一个编译时错误。

那么哪些类型实现了 `Copy` trait 呢？你可以查看给定类型的文档来确认，不过作为一个通用的规则，任何一组简单标量值的组合都可以实现 `Copy`，任何不需要分配内存或某种形式资源的类型都可以实现 `Copy` 。如下是一些 `Copy` 的类型：

- **所有整数类型，比如 `u32`**。
- **布尔类型，`bool`，它的值是 `true` 和 `false`**。
- **所有浮点数类型，比如 `f64`**。
- **字符类型，`char`**。
- **元组，当且仅当其包含的类型也都实现 `Copy` 的时候。比如，`(i32, i32)` 实现了 `Copy`，但 `(i32, String)` 就没有**。

##### 所有权与函数

将值传递给函数在语义上与给变量赋值相似。向函数传递值可能会移动或者复制，就像赋值语句一样。示例 4-3 使用注释展示变量何时进入和离开作用域：

```rust
// 示例 4-3：带有所有权和作用域注释的函数
fn main() {
  let s = String::from("hello");  // s 进入作用域

  takes_ownership(s);             // s 的值移动到函数里 ...
                                  // ... 所以到这里不再有效

  let x = 5;                      // x 进入作用域

  makes_copy(x);                  // x 应该移动函数里，
                                  // 但 i32 是 Copy 的，所以在后面可继续使用 x

} // 这里, x 先移出了作用域，然后是 s。但因为 s 的值已被移走，
  // 所以不会有特殊操作

fn takes_ownership(some_string: String) { // some_string 进入作用域
  println!("{}", some_string);
} // 这里，some_string 移出作用域并调用 `drop` 方法。占用的内存被释放

fn makes_copy(some_integer: i32) { // some_integer 进入作用域
  println!("{}", some_integer);
} // 这里，some_integer 移出作用域。不会有特殊操作
```

当尝试在调用 `takes_ownership` 后使用 `s` 时，Rust 会抛出一个编译时错误。这些静态检查使我们免于犯错。试试在 `main` 函数中添加使用 `s` 和 `x` 的代码来看看哪里能使用他们，以及所有权规则会在哪里阻止我们这么做。

##### 返回值与作用域

返回值也可以转移所有权。示例 4-4 与示例 4-3 一样带有类似的注释。

```rust
// 示例 4-4: 转移返回值的所有权
fn main() {
  let s1 = gives_ownership();         // gives_ownership 将返回值
                                      // 移给 s1

  let s2 = String::from("hello");     // s2 进入作用域

  let s3 = takes_and_gives_back(s2);  // s2 被移动到
                                      // takes_and_gives_back 中,
                                      // 它也将返回值移给 s3
} // 这里, s3 移出作用域并被丢弃。s2 也移出作用域，但已被移走，
  // 所以什么也不会发生。s1 移出作用域并被丢弃

fn gives_ownership() -> String {           // gives_ownership 将返回值移动给
                                           // 调用它的函数

  let some_string = String::from("yours"); // some_string 进入作用域

  some_string                              // 返回 some_string 并移出给调用的函数
}

// takes_and_gives_back 将传入字符串并返回该值
fn takes_and_gives_back(a_string: String) -> String { // a_string 进入作用域

  a_string  // 返回 a_string 并移出给调用的函数
}
```

变量的所有权总是遵循相同的模式：**将值赋给另一个变量时移动它。当持有堆中数据值的变量离开作用域时，其值将通过 `drop` 被清理掉，除非数据被移动为另一个变量所有**。

在每一个函数中都获取所有权并接着返回所有权有些啰嗦。如果我们想要函数使用一个值但不获取所有权该怎么办呢？如果我们还要接着使用它的话，每次都传进去再返回来就有点烦人了，除此之外，我们也可能想返回函数体中产生的一些数据。

我们可以使用元组来返回多个值，如示例 4-5 所示。

```rust
// 示例 4-5: 返回参数的所有权
fn main() {
    let s1 = String::from("hello");

    let (s2, len) = calculate_length(s1);

    println!("The length of '{}' is {}.", s2, len);
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() 返回字符串的长度

    (s, length)
}
```

但是这未免有些形式主义，而且这种场景应该很常见。幸运的是，Rust 对此提供了一个功能，叫做 **引用**（*references*）。

#### 引用

- 在任意给定时间，**要么** 只能有一个可变引用，**要么** 只能有多个不可变引用。

- 引用必须总是有效的。

  ![&String s pointing at String s1](https://rustwiki.org/zh-CN/book/img/trpl04-05.svg)

  ```rust
  fn main() {
      let s1 = String::from("hello");
  
      let len = calculate_length(&s1);
  
      println!("The length of '{}' is {}.", s1, len);
  }
  // 函数签名使用 & 来表明参数 s 的类型是一个引用
  fn calculate_length(s: &String) -> usize { // s 是对 String 的引用
      s.len()
  } // 这里，s 离开了作用域。但因为它并不拥有引用值的所有权，所以什么也不会发生
  
  ```

  ​	`&s1` 语法让我们创建一个 **指向** 值 `s1` 的引用，但是并不拥有它。因为并不拥有这个值，所以当引用停止使用时，它所指向的值也不会被丢弃。

  ​	变量 `s` 有效的作用域与函数参数的作用域一样，不过当引用停止使用时并不丢弃它指向的数据，因为我们没有所有权。当函数使用引用而不是实际值作为参数，无需返回值来交还所有权，因为就不曾拥有所有权。

  ​	我们将创建一个引用的行为称为 **借用**（*borrowing*）。正如现实生活中，如果一个人拥有某样东西，你可以从他那里借来。当你使用完毕，必须还回去。

  #### 可变引用

  - 在同一时间，只能有一个对某一特定数据的可变引用。尝试创建两个可变引用的代码将会失败
  - 不能在拥有不可变引用的同时拥有可变引用。
  - 多个不可变引用是可以的。

  ```rust
  fn main() {
      let mut s = String::from("hello");
  
      change(&mut s);
  }
  
  fn change(some_string: &mut String) {
      some_string.push_str(", world");
  }
  ```

  ​	防止同一时间对同一数据进行多个可变引用的限制允许可变性，不过是以一种受限制的方式允许。新 Rustacean 们经常难以适应这一点，因为大部分语言中变量任何时候都是可变的。这个限制的好处是 Rust 可以在编译时就避免数据竞争。**数据竞争**（*data race*）类似于竞态条件，它由这三个行为造成：

  - 两个或更多指针同时访问同一数据。
  - 至少有一个指针被用来写入数据。
  - 没有同步数据访问的机制。
  - 译注：以上三个行为**同时发生**才会造成数据竞争，而不是单一行为。

  一如既往，可以使用大括号来创建一个新的作用域，以允许拥有多个可变引用，只是不能 **同时** 拥有：

  ```rust
  fn main() {
      let mut s = String::from("hello");
  
      {
          let r1 = &mut s;
      } // r1 在这里离开了作用域，所以我们完全可以创建一个新的引用
  
      let r2 = &mut s;
  }
  ```

  ​	注意一个引用的作用域从声明的地方开始一直持续到最后一次使用为止。例如，因为最后一次使用不可变引用（println!)，发生在声明可变引用之前，所以如下代码是可以编译的:

  ```rust
  fn main() {
      let mut s = String::from("hello");
  
      let r1 = &s; // 没问题
      let r2 = &s; // 没问题
      println!("{} and {}", r1, r2);
      // 此位置之后 r1 和 r2 不再使用
  
      let r3 = &mut s; // 没问题
      println!("{}", r3);
  }
  ```

  ​	不可变引用 `r1` 和 `r2` 的作用域在 `println!` 最后一次使用之后结束，这也是创建可变引用 `r3` 的地方。它们的作用域没有重叠，所以代码是可以编译的。编译器在作用域结束之前判断不再使用的引用的能力被称为非词法作用域生命周期（Non-Lexical Lifetimes，简称 NLL）。尽管这些错误有时使人沮丧，但请牢记这是 Rust 编译器在提前指出一个潜在的 bug（在编译时而不是在运行时）并精准显示问题所在。这样你就不必去跟踪为何数据并不是你想象中的那样。

  #### 悬垂引用（Dangling References)

  ​	在具有指针的语言中，很容易通过释放内存时保留指向它的指针而错误地生成一个 **悬垂指针**（*dangling pointer*），所谓悬垂指针是其指向的内存可能已经被分配给其它持有者。相比之下，在 Rust 中编译器确保引用永远也不会变成悬垂状态：当你拥有一些数据的引用，编译器确保数据不会在其引用之前离开作用域。

  ```rust
  // 让我们尝试创建一个悬垂引用，Rust 会通过一个编译时错误来避免：
  fn main() {
      let reference_to_nothing = dangle();
  }
  
  fn dangle() -> &String { // dangle 返回一个字符串的引用
  
      let s = String::from("hello"); // s 是一个新字符串
  
      &s // 返回字符串 s 的引用
  } // 这里 s 离开作用域并被丢弃。其内存被释放。
    // 危险！
  ```

  ​	因为 `s` 是在 `dangle` 函数内创建的，当 `dangle` 的代码执行完毕后，`s` 将被释放。不过我们尝试返回它的引用。这意味着这个引用会指向一个无效的 `String`，这可不对！Rust 不会允许我们这么做。这里的解决方法是直接返回 `String`：

  ```rust
  //这样就没有任何错误了。所有权被移动出去，所以没有值被释放。
  fn main() {
      let string = no_dangle();
  }
  
  fn no_dangle() -> String {
      let s = String::from("hello");
  
      s
  }
  ```

#### 切片Slice类型

另一个没有所有权的数据类型是 *slice*。slice 允许你引用集合中一段连续的元素序列，而不用引用整个集合。

这里有一个编程小习题：编写一个函数，该函数接收一个字符串，并返回在该字符串中找到的第一个单词。如果函数在该字符串中并未找到空格，则整个字符串就是一个单词，所以应该返回整个字符串。让我们考虑一下这个函数的签名：

```rust
fn first_word(s: &String) -> ?
```

`first_word` 函数有一个参数 `&String`。因为我们不需要所有权，所以这没有问题。不过应该返回什么呢？我们并没有一个真正获取 **部分** 字符串的办法。不过，我们可以返回单词结尾的索引。试试如示例 4-7 中的代码。

```rust
// 示例 4-7：first_word 函数返回 String 参数的一个字节索引值
fn first_word(s: &String) -> usize {
    // 因为需要逐个元素的检查 String 中的值是否为空格，需要用 as_bytes 方法将 String 转化为字节数组：
    let bytes = s.as_bytes();
    // 接下来，使用 iter 方法在字节数组上创建一个迭代器：
    for (i, &item) in bytes.iter().enumerate() {
        // 在 for 循环中，我们通过字节的字面量语法来寻找代表空格的字节。如果找到了一个空格，返回它的位置。
        if item == b' ' {
            return i;
        }
    }
    // 否则，使用 s.len() 返回字符串的长度
    s.len()
}
```

`iter` 方法返回集合中的每一个元素，而 `enumerate` 包装了 `iter` 的结果，将这些元素作为元组的一部分来返回。`enumerate` 返回的元组中，第一个元素是索引，第二个元素是集合中元素的引用。这比我们自己计算索引要方便一些。

因为 `enumerate` 方法返回一个元组，我们可以使用模式来解构。所以在 `for` 循环中，我们指定了一个模式，其中元组中的 `i` 是索引而元组中的 `&item` 是单个字节。因为我们从 `.iter().enumerate()` 中获取了集合元素的引用，所以模式中使用了 `&`。

现在有了一个找到字符串中第一个单词结尾索引的方法，不过这有一个问题。我们返回了一个独立的 `usize`，不过它只在 `&String` 的上下文中才是一个有意义的数字。换句话说，因为它是一个与 `String` 相分离的值，无法保证将来它仍然有效。考虑一下示例 4-8 中使用了示例 4-7 中 `first_word` 函数的程序。

```rust
// 示例 4-8：存储 first_word 函数调用的返回值并接着改变 String 的内容
fn first_word(s: &String) -> usize {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }

    s.len()
}

fn main() {
    let mut s = String::from("hello world");

    let word = first_word(&s); // word 的值为 5

    s.clear(); // 这清空了字符串，使其等于 ""

    // word 在此处的值仍然是 5，
    // 但是没有更多的字符串让我们可以有效地应用数值 5。word 的值现在完全无效！
}
```

这个程序编译时没有任何错误，而且在调用 `s.clear()` 之后使用 `word` 也不会出错。因为 `word` 与 `s` 状态完全没有联系，所以 `word` 仍然包含值 `5`。可以尝试用值 `5` 来提取变量 `s` 的第一个单词，不过这是有 bug 的，因为在我们将 `5` 保存到 `word` 之后 `s` 的内容已经改变。我们不得不时刻担心 `word` 的索引与 `s` 中的数据不再同步，这很啰嗦且易出错！如果编写这么一个 `second_word` 函数的话，管理索引这件事将更加容易出问题。它的签名看起来像这样：

```rust
fn second_word(s: &String) -> (usize, usize) {
```

现在我们要跟踪一个开始索引 **和** 一个结尾索引，同时有了更多从数据的某个特定状态计算而来的值，但都完全没有与这个状态相关联。现在有三个飘忽不定的不相关变量需要保持同步。幸运的是，Rust 为这个问题提供了一个解决方法：字符串 slice。

##### **字符串 slice**

**字符串 slice**（*string slice*）是 `String` 中一部分值的引用，它看起来像这样：

```rust
fn main() {
    let s = String::from("hello world");

    let hello = &s[0..5];
    let world = &s[6..11];
}
```

这类似于引用整个 `String` 不过带有额外的 `[0..5]` 部分。它不是对整个 `String` 的引用，而是对部分 `String` 的引用。

可以使用一个由中括号中的 `[starting_index..ending_index]` 指定的 range 创建一个 slice，其中 `starting_index` 是 slice 的第一个位置，`ending_index` 则是 slice 最后一个位置的后一个值。在其内部，slice 的数据结构存储了 slice 的开始位置和长度，长度对应于 `ending_index` 减去 `starting_index` 的值。所以对于 `let world = &s[6..11];` 的情况，`world` 将是一个包含指向 `s` 索引 6 的指针和长度值 5 的 slice。

![world containing a pointer to the byte at index 6 of String s and a length 5](https://rustwiki.org/zh-CN/book/img/trpl04-06.svg)

对于 Rust 的 `..` range 语法，如果想要从索引 0 开始，可以不写两个点号之前的值。换句话说，如下两个语句是相同的：

```rust
#![allow(unused)]
fn main() {
    let s = String::from("hello");

    let slice = &s[0..2];
    let slice = &s[..2];
}
```

依此类推，如果 slice 包含 `String` 的最后一个字节，也可以舍弃尾部的数字。这意味着如下也是相同的：

```rust
#![allow(unused)]
fn main() {
    let s = String::from("hello");

    let len = s.len();

    let slice = &s[3..len];
    let slice = &s[3..];
}
```

也可以同时舍弃这两个值来获取整个字符串的 slice。所以如下亦是相同的：

```rust
#![allow(unused)]
fn main() {
    let s = String::from("hello");

    let len = s.len();

    let slice = &s[0..len];
    let slice = &s[..];
}
```

*字符串 slice range 的索引必须位于有效的 UTF-8 字符边界内，如果尝试从一个多字节字符的中间位置创建字符串 slice，则程序将会因错误而退出。出于介绍字符串 slice 的目的，本部分假设只使用 ASCII 字符集；*

在记住所有这些知识后，让我们重写 `first_word` 来返回一个 slice。“字符串 slice” 的类型声明写作 `&str`：

```rust
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}
```

我们使用跟示例 4-7 相同的方式获取单词结尾的索引，通过寻找第一个出现的空格。当找到一个空格，我们返回一个字符串 slice，它使用字符串的开始和空格的索引作为开始和结束的索引。

现在当调用 `first_word` 时，会返回与底层数据关联的单个值。这个值由一个 slice 开始位置的引用和 slice 中元素的数量组成。

##### 字符串字面量就是 slice

```rust
let s = "Hello, world!";
```

这里 `s` 的类型是 `&str`：它是一个指向二进制程序特定位置的 slice。这也就是为什么字符串字面量是不可变的；`&str` 是一个不可变引用。

##### 字符串 slice 作为参数

- 参数为 `&str` 可以使用`String` 值和 `&str` 值

```rust
fn first_word(s: &str) -> &str {
```

如果有一个字符串 slice，可以直接传递它。如果有一个 `String`，则可以传递整个 `String` 的 slice 或对 `String` 的引用。这种灵活性利用了 *deref coercions* 的优势。

```rust
fn first_word(s: &str) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}

fn main() {
    let my_string = String::from("hello world");

    // `first_word` 接受 `String` 的切片，无论是部分还是全部
    let word = first_word(&my_string[0..6]);
    let word = first_word(&my_string[..]);
    // `first_word` 也接受 `String` 的引用，
    // 这等同于 `String` 的全部切片
    let word = first_word(&my_string);

    let my_string_literal = "hello world";

    // `first_word` 接受字符串字面量的切片，无论是部分还是全部
    let word = first_word(&my_string_literal[0..6]);
    let word = first_word(&my_string_literal[..]);

    // 因为字符串字面值**就是**字符串 slice，
    // 这样写也可以，即不使用 slice 语法！
    let word = first_word(my_string_literal);
}
```

##### 其他类型的 slice

就跟我们想要获取字符串的一部分那样，我们也会想要引用数组的一部分。我们可以这样做：

```rust
let a = [1, 2, 3, 4, 5];
let slice = &a[1..3];
```

这个 slice 的类型是 `&[i32]`。它跟字符串 slice 的工作方式一样，通过存储第一个集合元素的引用和一个集合总长度。你可以对其他所有集合使用这类 slice。



# Struct

*struct*，或者 *structure*，是一个自定义数据类型，允许你命名和包装多个相关的值，从而形成一个有意义的组合。**结构体的每一部分可以是不同类型**。但不同于元组，结构体需要命名各部分数据以便能清楚的表明其值的意义。由于有了这些名字，结构体比元组更灵活：不需要依赖顺序来指定或访问实例中的值。

定义结构体，需要使用 `struct` 关键字并为整个结构体提供一个名字。结构体的名字需要描述它所组合的数据的意义。接着，在大括号中，定义每一部分数据的名字和类型，我们称为 **字段**（*field*）。

```rust
// 一个存储用户账号信息的结构体
struct User {
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}
```

