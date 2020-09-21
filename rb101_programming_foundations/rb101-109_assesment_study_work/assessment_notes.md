# Using programming terms

## Example #1

```ruby
a = 'hello'
b = a
a = 'goodbye'
```

On `line 1` of this code, the variable `a` is initialized and assigned a `String` object with value `'hello'`.

On `line 2`, the variable `b` is initialized and assigned the `String` object that variable `a` is referencing. Both variable `a` and variable `b` are pointing to the same `String` object with value `'hello'`.

On `line 3`, variable `a` is reassigned a `String` object with value `'goodbye'`. Variable `b` is still pointing to the `String` object with value `'hello'`.

## Example #2

```ruby
def example(str)
  i = 3

  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

On `lines 1-9`, the method `example` is defined which takes 1 parameter.

On `line 11` the method `example` is called and passed in the `String` object `'hello'` as an argument.

On `line 1`, the parameter is initialized as variable `str` and assigned the argument `String` object `'hello'`.

On `line 2`, the local variable `i` is initialized and assigned the `Integer` object with value `3`.

On `line 4`, the method `loop` is called and passed in the `do..end` block and as an argument.

On `line 5`, the method `puts` is called and passed in the local variable `str` as an argument.

On `line 6`, the local variable `i` is reassigned the return value of `i - 1`.

On `line 7`, the keyword `break` will terminate the `loop` method if the local variable `i` is equal to the `Integer` object `0`.

The method `example` will **output** the `String` object `'hello'` three times. Since there is no explicit `return` statement within the method definition, the last evaluated expression is returned. In this case, `break if i == 0` is the last evaluated statement, which **returns** `nil`. So, the method **returns** `nil`.

## Example #3

```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```

On `line 1` of this code, the variable `a` is initialized and assigned the `Integer` object with value `4`.

On `line 3`, the method `loop` is called and passed in the `do..end` block and as an argument.

On `line 4`, the method reassigns the variable `a` to an `Integer` object with value `5`.

On `line 5`, the method initializes and assigns the local variable `b` to an `Integer` object with value `3`.

On `line 6`, the keyword `break` will terminate the `loop` after 1 iteration.

On `line 9`, the method `puts` is called and passed in the variable `a` as an argument. The method `puts` will **output** the `Integer` object `5` and will **return** `nil`.

On `line 10`, the method `puts` is called and passed in the variable `b` as an argument. Since the variable `b` was defined by the `do..end` block, it is not available to the outer scope. The method `puts` will raise an error, `undefined local variable or method b`.
