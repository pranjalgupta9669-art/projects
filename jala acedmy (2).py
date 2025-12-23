import math
import re
import os
from abc import ABC, abstractmethod

# ==========================================
# 1. PYTHON BASICS
# ==========================================

def print_name():
    print("Your Name")

def data_types_demo():
    i = 10
    b = True
    c = 'A'
    f = 10.5
    d = 20.99
    print(f"Int: {i}, Bool: {b}, Char: {c}, Float: {f}, Double: {d}")

var_scope = "Global"

def scope_test():
    var_scope = "Local"
    print(f"Local: {var_scope}")
    print(f"Global: {globals()['var_scope']}")

# ==========================================
# 2. OPERATORS
# ==========================================

def arithmetic_ops(a, b):
    return {"+": a+b, "-": a-b, "*": a*b, "/": a/b}

def inc_dec(n):
    n += 1
    print(f"Incremented: {n}")
    n -= 1
    print(f"Decremented: {n}")

def relational_ops(a, b):
    print(a == b, a != b, a < b, a <= b, a > b, a >= b)

def min_max(a, b):
    print(f"Smaller: {min(a, b)}, Larger: {max(a, b)}")

# ==========================================
# 3. LOOPS
# ==========================================

def loops_demo():
    for _ in range(10):
        print("Bright IT Career")

    i = 1
    while i <= 20:
        print(i, end=" ")
        i += 1

    print("\nEven numbers 10–20:")
    j = 10
    while j <= 20:
        if j % 2 == 0:
            print(j, end=" ")
        j += 1
    print()

# ==========================================
# 4. ARRAYS (LISTS)
# ==========================================

def array_basics(arr):
    total = sum(arr)
    avg = total / len(arr) if arr else 0
    return total, avg

def find_duplicates(arr):
    return list(set(x for x in arr if arr.count(x) > 1))

# ==========================================
# 5. STATIC VARIABLE
# ==========================================

class StaticTest:
    static_var = "Initial Static Value"

    def change_instance(self):
        StaticTest.static_var = "Changed via Instance"

# ==========================================
# 6. STRINGS
# ==========================================

def string_demo():
    s1 = "Hello"
    s2 = "World"
    s3 = s1 + " " + s2
    print(f"Length: {len(s3)}")
    print(s3.replace("World", "Python"))

# ==========================================
# 7. INHERITANCE
# ==========================================

class A:
    def override_method(self):
        print("Override A")

class B(A):
    def override_method(self):
        print("Override B")

class C(B):
    def override_method(self):
        print("Override C")

# ==========================================
# 8. ACCESS MODIFIERS
# ==========================================

class AccessDemo:
    def __init__(self):
        self.__private_field = "Private"

    def __private_method(self):
        print("This is private")

# ==========================================
# 9. ABSTRACT CLASS
# ==========================================

class AbstractBase(ABC):
    @abstractmethod
    def abs_method(self):
        pass

    def non_abs_method(self):
        print("Non-abstract method")

class Child(AbstractBase):
    def abs_method(self):
        print("Implemented abstract method")

# ==========================================
# 10. PACKAGES (SIMULATED)
# ==========================================

class PackageClassOne:
    def __init__(self):
        print("PackageClassOne constructor")

    def method_one(self):
        print("Method One")

class PackageClassTwo:
    def __init__(self):
        print("PackageClassTwo constructor")

    def method_two(self):
        print("Method Two")

def demo_packages():
    obj1 = PackageClassOne()
    obj2 = PackageClassTwo()
    obj1.method_one()
    obj2.method_two()

# ==========================================
# 11. FILE HANDLING
# ==========================================

def demo_files():
    filename = "test_file.txt"

    with open(filename, "w") as f:
        f.write("Hello JALA Technologies\nSecond Line\nThird Line")

    with open(filename, "r") as f:
        print(f.read())

    with open(filename, "r") as f:
        f.seek(6)
        print(f.read(12))

    print("Readable:", os.access(filename, os.R_OK))
    print("Writable:", os.access(filename, os.W_OK))

# ==========================================
# 12. CONSTRUCTORS
# ==========================================

class ConstructorDemo:
    def __init__(self, arg1=None, arg2=None):
        if arg1 is None and arg2 is None:
            print("Default constructor")
        elif arg2 is None:
            print("One-argument constructor:", arg1)
        else:
            print("Two-argument constructor:", arg1, arg2)

class ChildConstructor(ConstructorDemo):
    def __init__(self):
        super().__init__("Param1")
        print("Child constructor")

# ==========================================
# 13. METHOD OVERLOADING
# ==========================================

class OverloadDemo:
    def add(self, a, b, c=None):
        return a + b + c if c is not None else a + b

# ==========================================
# 14. EXCEPTIONS
# ==========================================

class MyCustomException(Exception):
    pass

def demo_exceptions():
    try:
        print(10 / 0)
    except ZeroDivisionError as e:
        print("Arithmetic Exception:", e)

    try:
        open("notfound.txt")
    except FileNotFoundError:
        print("FileNotFoundError")
    finally:
        print("Finally block executed")

    try:
        raise MyCustomException("Custom exception message")
    except MyCustomException as e:
        print(e)

# ==========================================
# 15. DICTIONARY
# ==========================================

def demo_dictionary():
    students = {
        101: "Alice",
        102: "Bob",
        103: "Charlie",
        104: "David",
        105: "Eve"
    }

    students[106] = "Frank"
    students[101] = "Alice Smith"
    print(students[102])
    print(students.keys())
    del students[105]

# ==========================================
# MAIN EXECUTION
# ==========================================

if __name__ == "__main__":
    print_name()
    data_types_demo()
    scope_test()
    loops_demo()

    obj = C()
    obj.override_method()

    demo_packages()
    demo_files()

    ConstructorDemo()
    ConstructorDemo("A")
    ConstructorDemo("A", "B")
    ChildConstructor()

    demo_exceptions()
    demo_dictionary()
