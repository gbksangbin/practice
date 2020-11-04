const TARGET_STRING = "AAABBBCCC";

let result = "";
let nowCharacter = "";
let nowCharacterCount = 0;

for (const char of TARGET_STRING) {
    if (!nowCharacter) {
        nowCharacter = char;
        nowCharacterCount ++;
    } else {
        if (nowCharacter === char) {
            nowCharacterCount ++;
        }
        else {
            if (nowCharacterCount === 1) {
                result += `${nowCharacterCount}${nowCharacter}`;    
            }
            else {
                result += `${nowCharacterCount}${nowCharacter}`;
            }
            nowCharacter = char;
            nowCharacterCount = 1;
        }
    }
}

console.log(result);