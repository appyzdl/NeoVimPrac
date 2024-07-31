from functools import reduce
from operator import add

people = [
    {"name": "Mary", "height": 160},
    {"name": "Isla", "height": 80},
    {"name": "Sam"},
]

# Use filter to keep only people with height
people_with_height = filter(lambda person: "height" in person, people)

# Use map to extract heights
heights = map(lambda person: person["height"], people_with_height)

# Convert heights to a list for multiple use
heights_list = list(heights)

if heights_list:
    # Use reduce to sum heights
    total_height = reduce(add, heights_list)

    # Calculate average
    average_height = total_height / len(heights_list)

    print(f"The average height is {average_height:.2f}")
else:
    print("No height data available")
