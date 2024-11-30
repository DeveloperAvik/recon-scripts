import itertools

def generate_variations(input_str):
    transformations = [
        input_str,
        input_str.lower(),
        input_str.upper(),
        input_str.capitalize(),
        input_str[::-1]  
    ]
    
    common_suffixes = [
        '', '123', '1234', '12345', '!', '@', '#', '$', '%', '01', '12', '2023', '2024',
        '789', '000', '007', '1', '111', '222', '333', '777', '999', 'password', 'qwerty',
        '2020', '2021', '2022', 'abc', 'xyz', 'pass', 'secure', 'login', 'love', 'admin',
        'pass1', 'test', 'guest', 'root', 'god', 'master', 'owner'
    ]
    
    variations = [f"{t}{s}" for t in transformations for s in common_suffixes]
    return variations

def create_wordlist(input_str, filename="pass.txt"):
    variations = generate_variations(input_str)
    
    common_words = ["password", "pass", "admin", "user", "login", "access", "secure", "my", "account"]
    additional_variations = []
    
    for word in common_words:
        for variation in variations:
            additional_variations.append(f"{variation}{word}")
            additional_variations.append(f"{word}{variation}")
    
    full_wordlist = variations + additional_variations

    with open(filename, "w") as f:
        for word in full_wordlist:
            f.write(word + "\n")
    
    print(f"Wordlist with {len(full_wordlist)} entries saved to '{filename}'")

if __name__ == "__main__":
    user_input = input("Enter a name or email to generate wordlist: ")
    create_wordlist(user_input)
