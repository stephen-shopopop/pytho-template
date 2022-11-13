# content of test_sample.py
def inc(value: int):
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
