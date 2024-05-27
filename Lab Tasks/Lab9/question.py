def fib(number):
    if number == 1:
        return 1
    elif number == 0:
        return 0
    else:
        return fib(number) + fib(number-1)