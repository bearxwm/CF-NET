"""
CROSS FUSE

1 IS TEST
2 IS MATLAB ONLY

"""


def main():

    MODE = int(input("Please input MODE \n1 for test OR 2 for matlab!!"))

    if MODE is 1:
        from test import test
        test()
    elif MODE is 2:
        from test import matlab_only
        matlab_only()


if __name__ == '__main__':
    main()
