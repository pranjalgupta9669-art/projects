import math
import re

# ==========================================
# 1. PYTHON BASICS [cite: 30]
# ==========================================

# 1.1 Print name [cite: 31]
def print_name():
    print("Your Name")

# 1.2 Single and multi-line comments [cite: 32]
# This is a single-line comment.
"""
This is a 
multi-line comment.
"""

# 1.3 Data Types [cite: 33]
def data_types_demo():
    i = 10                  # int
    b = True                # Boolean
    c = 'A'                 # char (String in Python)
    f = 10.5                # float
    d = 20.99               # double (float in Python)
    print(f"Int: {i}, Bool: {b}, Char: {c}, Float: {f}, Double: {d}")

# 1.4 Variable Scope [cite: 34]
var_scope = "Global"
def scope_test():
    var_scope = "Local"
    print(f"Local: {var_scope}")
    print(f"Global: {globals()['var_scope']}")

# ==========================================
# 2. OPERATORS [cite: 5]
# ==========================================

# 2.1 Arithmetic Operators [cite: 6]
def arithmetic_ops(a, b):
    return {"+": a+b, "-": a-b, "*": a*b, "/": a/b}

# 2.2 Increment/Decrement [cite: 7]
# Note: Python uses += 1 and -= 1 as it lacks ++/-- operators.
def inc_dec(n):
    n += 1
    print(f"Incremented: {n}")
    n -= 1
    print(f"Decremented: {n}")

# 2.3 Equality [cite: 8] and Relational [cite: 9]
def relational_ops(a, b):
    print(f"Equal: {a == b}")
    print(f"Not Equal: {a != b}")
    print(f"Less than: {a < b}")
    print(f"Less than/Equal: {a <= b}")
    print(f"Greater: {a > b}")
    print(f"Greater/Equal: {a >= b}")

# 2.4 Smaller and Larger [cite: 10]
def min_max(a, b):
    print(f"Smaller: {min(a, b)}, Larger: {max(a, b)}")

# ==========================================
# 3. LOOPS [cite: 109]
# ==========================================

def loops_demo():
    # 3.1 Ten times print [cite: 110]
    for _ in range(10): print("Bright IT Career")
    
    # 3.2 1 to 20 using while [cite: 111]
    i = 1
    while i <= 20:
        print(i, end=" ")
        i += 1
    
    # 3.4/3.6 Odd/Even and range [cite: 113, 115]
    print("\nEven numbers 10-20:")
    j = 10
    while j <= 20:
        if j % 2 == 0: print(j, end=" ")
        j += 1

# ==========================================
# 4. ARRAYS [cite: 144]
# ==========================================

# 4.1-4.3 Add, Average, Index [cite: 145, 146, 147]
def array_basics(arr):
    total = sum(arr)
    avg = total / len(arr) if arr else 0
    return total, avg

# 4.10 Duplicate values [cite: 155]
def find_duplicates(arr):
    return list(set([x for x in arr if arr.count(x) > 1]))

# ==========================================
# 5. STATIC [cite: 18]
# ==========================================

class StaticTest:
    static_var = "Initial Static Value" # [cite: 19]

    def change_instance(self):
        # 5.3 Change within instance [cite: 21]
        StaticTest.static_var = "Changed via Instance"

# ==========================================
# 6. STRINGS [cite: 86]
# ==========================================

def string_demo():
    s1 = "Hello"
    s2 = "World"
    # 6.2 Concatenation [cite: 88]
    s3 = s1 + " " + s2
    # 6.3 Length [cite: 89]
    print(f"Length: {len(s3)}")
    # 6.10 Replace [cite: 96]
    print(s3.replace("World", "Python"))

# ==========================================
# 7. INHERITANCE [cite: 130]
# ==========================================

class A:
    def method_a1(self): print("A1")
    def method_a2(self): print("A2")
    def override_method(self): print("Override A") # [cite: 133]

class B(A):
    def method_b1(self): print("B1")
    def method_b2(self): print("B2")
    def override_method(self): print("Override B") # [cite: 133]

class C(B):
    def method_c1(self): print("C1")
    def method_c2(self): print("C2")
    def override_method(self): print("Override C") # [cite: 133]

# ==========================================
# 8. ACCESS MODIFIERS [cite: 42]
# ==========================================

class AccessDemo:
    def __init__(self):
        self.__private_field = "Private" # [cite: 43]
    
    def __private_method(self): # [cite: 43]
        print("This is private")

# ==========================================
# 9. ABSTRACT CLASS [cite: 58]
# ==========================================

from abc import ABC, abstractmethod

class AbstractBase(ABC): # [cite: 59]
    @abstractmethod
    def abs_method(self): pass
    
    def non_abs_method(self):
        print("Non-abstract method")

class Child(AbstractBase): # [cite: 60]
    def abs_method(self):
        print("Implemented abstract method")

# ==========================================
# MAIN EXECUTION
# ==========================================
if __name__ == "__main__":
    print_name()
    data_types_demo()
    scope_test()
    loops_demo()
    
    # Inheritance test [cite: 134]
    obj_c = C()
    obj_c.override_method()
    import os
import io

# ==========================================
# [cite_start]10. PACKAGES [cite: 386]
# ==========================================
# [cite_start]Note: In a real environment, these would be in separate files with an __init__.py [cite: 390]
class PackageClassOne:
    [cite_start]def __init__(self): [cite: 388]
        print("Constructor for PackageClassOne called")
    [cite_start]def method_one(self): [cite: 388]
        print("Method in PackageClassOne")

class PackageClassTwo:
    [cite_start]def __init__(self): [cite: 388]
        print("Constructor for PackageClassTwo called")
    [cite_start]def method_two(self): [cite: 388]
        print("Method in PackageClassTwo")

def demo_packages():
    [cite_start]obj1 = PackageClassOne() [cite: 392]
    [cite_start]obj2 = PackageClassTwo() [cite: 392]
    obj1.method_one()
    obj2.method_two()

# ==========================================
# [cite_start]11. FILES [cite: 402]
# ==========================================
def demo_files():
    filename = "test_file.txt"
    
    # [cite_start]11.2 Write text to file [cite: 403]
    with open(filename, "w") as f:
        f.write("Hello JALA Technologies\nSecond Line\nThird Line")
    
    # [cite_start]11.1 Read text file [cite: 401]
    with open(filename, "r") as f:
        print(f"Read Content: {f.read()}")
    
    # [cite_start]11.5 Read to particular index using seek() [cite: 406]
    with open(filename, "r") as f:
        [cite_start]f.seek(6) [cite: 406]
        print(f"Content from index 6: {f.read(12)}")
    
    # [cite_start]11.6 Check read/write permissions [cite: 407]
    [cite_start]print(f"Readable: {os.access(filename, os.R_OK)}") [cite: 407]
    [cite_start]print(f"Writable: {os.access(filename, os.W_OK)}") [cite: 407]

# ==========================================
# [cite_start]12. CONSTRUCTORS [cite: 415]
# ==========================================
class ConstructorDemo:
    # Python does not support multiple constructors like Java. 
    # [cite_start]We use default arguments to simulate 1 and 2 argument constructors. [cite: 416]
    def __init__(self, arg1=None, arg2=None):
        if arg1 is None and arg2 is None:
            [cite_start]print("Default constructor called") [cite: 416]
        elif arg2 is None:
            [cite_start]print(f"One-argument constructor called: {arg1}") [cite: 416]
        else:
            [cite_start]print(f"Two-argument constructor called: {arg1}, {arg2}") [cite: 416]

class ChildConstructor(ConstructorDemo):
    def __init__(self):
        [cite_start]super().__init__("Param1") # Calling superclass argument constructor [cite: 418]
        print("Child constructor called")

# ==========================================
# [cite_start]13. METHOD OVERLOADING [cite: 427]
# ==========================================
class OverloadDemo:
    # [cite_start]Python handles overloading via variable arguments or default parameters [cite: 428, 429]
    def add(self, a, b, c=None):
        if c is not None:
            [cite_start]return a + b + c # Three parameters [cite: 428]
        [cite_start]return a + b # Two parameters [cite: 428]

# ==========================================
# [cite_start]14. EXCEPTIONS [cite: 437]
# ==========================================
[cite_start]class MyCustomException(Exception): [cite: 443]
    pass

def demo_exceptions():
    # [cite_start]14.2 Handle Arithmetic Exception [cite: 439]
    try:
        [cite_start]result = 10 / 0 [cite: 438, 445]
    except ZeroDivisionError as e:
        [cite_start]print(f"Caught Arithmetic Exception: {e}") [cite: 439]
    
    # [cite_start]14.4 Multiple catch blocks [cite: 441]
    try:
        # [cite_start]14.9 FileNotFoundException [cite: 447]
        with open("non_existent.txt", "r") as f:
            pass
    [cite_start]except FileNotFoundError: [cite: 441, 447]
        print("Caught FileNotFoundError")
    [cite_start]except IOError: [cite: 441, 449]
        print("Caught General IOError")
    finally:
        [cite_start]print("Finally block executed") [cite: 444]

    # [cite_start]14.5 Throw exception with own message [cite: 442]
    try:
        [cite_start]raise MyCustomException("This is a custom error message") [cite: 442, 443]
    except MyCustomException as e:
        print(e)

# ==========================================
# [cite_start]15. DICTIONARY [cite: 456]
# ==========================================
def demo_dictionary():
    # [cite_start]15.1 Create Dictionary with 5 student IDs [cite: 457]
    students = {101: "Alice", 102: "Bob", 103: "Charlie", 104: "David", 105: "Eve"}
    
    [cite_start]students[106] = "Frank" # 15.1.1 Adding [cite: 458]
    [cite_start]students[101] = "Alice Smith" # 15.1.2 Updating [cite: 459]
    [cite_start]print(f"Access ID 102: {students[102]}") # 15.1.3 Accessing [cite: 460]
    
    # [cite_start]15.1.4 Nested loop dictionary [cite: 461]
    nested_dict = {
        "Class_A": {1: "John", 2: "Jane"},
        "Class_B": {3: "Doe", 4: "Smith"}
    }
    
    [cite_start]print(f"Keys: {students.keys()}") # 15.1.6 Print keys [cite: 463]
    [cite_start]del students[105] # 15.1.7 Delete value [cite: 464]

# ==========================================
# [cite_start]MAIN EXECUTION [cite: 393, 417]
# ==========================================
if __name__ == "__main__":
    print("--- Package Demo ---")
    demo_packages()
    
    print("\n--- File Demo ---")
    demo_files()
    
    print("\n--- Constructor Demo ---")
    [cite_start]c1 = ConstructorDemo() # Default [cite: 416, 417]
    [cite_start]c2 = ConstructorDemo("Arg1") # One arg [cite: 416, 417]
    [cite_start]c3 = ConstructorDemo("Arg1", "Arg2") # Two arg [cite: 416, 417]
    [cite_start]child = ChildConstructor() [cite: 418]
    
    print("\n--- Exception Demo ---")
    demo_exceptions()
    
    print("\n--- Dictionary Demo ---")
    demo_dictionary()