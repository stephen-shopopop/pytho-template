# content of test_sample.py
def inc(x):
    """
    increment
    """
    return x + 1


def test_answer():
    """
    >>> inc(3)
    >>> 4
    """
    assert inc(3) == 4
