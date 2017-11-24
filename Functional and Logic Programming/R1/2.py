#welovepython

otherwise = True

def substitue(a, i, v):
	if not a:
		 return []
	if i == 0:
		return [v] + substitue(a[1:], i-1, v)
	if otherwise:
		return [a[0]] + substitue(a[1:], i-1, v)


print substitue([1, 2, 3, 4], 0, 99)

def find_element(v, a):
	if not a:
		return False
	if a[0] == v:
		return True
	if otherwise:
		return find_element(v, a[1:])


def difference(set1, set2):
	if not set1:
		return []
	if not find_element(set1[0], set2):
		return [set1[0]] + difference(set1[1:], set2)
	if otherwise:
		return difference(set1[1:], set2)


print difference([1, 2, 3], [2, 3])
print difference([1, 3, 4], [])
print difference([], [2])
