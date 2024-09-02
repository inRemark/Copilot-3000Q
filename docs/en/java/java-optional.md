# Java Optional

## Question

详细介绍下Java `Optional`，并给出示例和常用场景。

## Copilot Say

### Java Optional 详细介绍

`Optional` 是 Java 8 引入的一个容器类，用于表示可能包含或不包含非空值的对象。它主要用于避免显式的 `null` 检查，从而减少 `NullPointerException` 的出现。

### 主要方法

- 创建 Optional 对象：

  - `Optional.of(T value)`: 创建一个包含非空值的 Optional 对象。如果传入的值为 `null`，则抛出 `NullPointerException`。
  
  - `Optional.ofNullable(T value)`: 创建一个可能包含空值的 `Optional` 对象。如果传入的值为 null，则创建一个空的 `Optional` 对象。
  
  - `Optional.empty()`: 创建一个空的 `Optional` 对象。

- 检查值是否存在：
  - `boolean isPresent()`: 如果值存在，返回 `true`，否则返回 `false`。
  - `boolean isEmpty()`: 如果值不存在，返回 `true`，否则返回 `false`（Java 11 引入）。

- 获取值：

  - `T get()`: 如果值存在，返回该值，否则抛出 `NoSuchElementException`。
  - `T orElse(T other)`: 如果值存在，返回该值，否则返回 other。
  - `T orElseGet(Supplier<? extends T> other)`: 如果值存在，返回该值，否则返回由 Supplier 提供的值。
  - `T orElseThrow()`: 如果值存在，返回该值，否则抛出 `NoSuchElementException`（Java 10 引入）。
  - `T orElseThrow(Supplier<? extends X> exceptionSupplier)`: 如果值存在，返回该值，否则抛出由 Supplier 提供的异常。

- 值的操作：
  - `void ifPresent(Consumer<? super T> action)`: 如果值存在，执行给定的操作。
  - `Optional<T> filter(Predicate<? super T> predicate)`: 如果值存在并且满足给定的谓词，返回包含该值的 Optional，否则返回一个空的 Optional。
  - `<U> Optional<U> map(Function<? super T, ? extends U> mapper)`: 如果值存在，应用给定的映射函数并返回一个包含映射结果的 Optional，否则返回一个空的 Optional。
  - `<U> Optional<U> flatMap(Function<? super T, Optional<U>> mapper)`: 与 `map` 类似，但映射函数返回的是 `Optional`。

### 常用场景

- 避免显式的 `null` 检查：
使用 `Optional` 可以避免显式的 `null` 检查，从而使代码更加简洁和易读。

- 返回可能为空的值：
在方法返回值中使用 `Optional`，可以明确表示该方法可能返回空值，从而提高代码的可读性和安全性。

- 链式调用：
使用 `Optional` 的 `map` 和 `flatMap` 方法，可以方便地进行链式调用，从而避免嵌套的 `if-else` 语句。

- 处理缺失值：
使用 `orElse`、`orElseGet` 和 `orElseThrow` 方法，可以方便地处理缺失值，从而避免 `NullPointerException`。

通过使用 `Optional`，可以使代码更加健壮，减少空指针异常的发生，提高代码的可读性和可维护性。

### 示例代码

```java
import java.util.Optional;

public class OptionalExample {
    public static void main(String[] args) {
        // 创建 Optional 对象
        Optional<String> nonEmptyOptional = Optional.of("Hello, World!");
        Optional<String> emptyOptional = Optional.empty();
        Optional<String> nullableOptional = Optional.ofNullable(null);

        // 检查值是否存在
        System.out.println("nonEmptyOptional is present: " + nonEmptyOptional.isPresent());
        System.out.println("emptyOptional is present: " + emptyOptional.isPresent());

        // 获取值
        System.out.println("nonEmptyOptional value: " + nonEmptyOptional.get());
        System.out.println("emptyOptional value or default: " + emptyOptional.orElse("Default Value"));

        // 值的操作
        nonEmptyOptional.ifPresent(value -> System.out.println("Value is present: " + value));

        String result = nonEmptyOptional
                .filter(value -> value.startsWith("Hello"))
                .map(String::toUpperCase)
                .orElse("Default Value");
        System.out.println("Filtered and mapped value: " + result);

        // 使用 orElseThrow
        try {
            emptyOptional.orElseThrow(() -> new IllegalArgumentException("Value is missing"));
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }
}
```
