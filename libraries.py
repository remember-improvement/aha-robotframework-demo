import uuid
import random
import string


def generate_uuid():
    result = uuid.uuid4()
    return str(result)

def generate_random_email():
    generator = ''.join(random.choice(string.ascii_lowercase)for i in range(8))
    random_name = ''
    for letter in generator:
        random_name += letter
    random_email = random_name + '@disposeamail.com'

    return random_email


def generate_random_name():
    generator = ''.join(random.choice(string.ascii_lowercase)for i in range(8))
    random_name = ''
    for letter in generator:
        random_name += letter

    return random_name

def generate_random_phone_number():
    generator = ''.join(random.choice(string.octdigits)for i in range(8))
    phone_number = '09'
    for digit in generator:
        phone_number+=digit
    return phone_number

def generate_random_password():
    generator = ''.join(random.choice(string.octdigits)for i in range(4))
    password = 'Rentmotor'
    for digit in generator:
        password+=digit
    return password

def generate_random_id_number():
    local_table = {'A':10,'B':11,'C':12,'D':13,'E':14,'F':15,'G':16,'H':17,'I':34,
        'J':18,'K':19,'L':20,'M':21,'N':22,'O':35,'P':23,'Q':24,'R':25,
        'S':26,'T':27,'U':28,'V':29,'W':32,'X':30,'Y':31,'Z':33}
    #local_table = {'A':10,'B':11}
    local = random.choice(list(local_table.keys()))

    check_arr = list(str(local_table[local]))
    check_arr[0] = int(check_arr[0])
    check_arr[1] = int(check_arr[1]) * 9

    sex = random.choice([1,2])
    check_arr.append(sex * 8)

    nums_str = ''
    for i in range(7):
        nums = random.randint(0, 9)
        nums_str = nums_str + str(nums)
        check_arr.append(nums*(7-i))

    check_num = 10 - sum(check_arr)%10
    if check_num == 10: 
        check_num = 0

    id_number = str(local) + str(sex) + nums_str + str(check_num)

    return id_number
 

def get_logs():
    se2lib = BuiltIn().get_library_instance('Selenium2Library')

    try:
        return se2lib._current_browser().get_log("all")

    # issues while retrieving logs: return empty
    except Exception as e:
        print(str(e))

    return []

    
if __name__ == '__main__':
    print(generate_random_id_number())