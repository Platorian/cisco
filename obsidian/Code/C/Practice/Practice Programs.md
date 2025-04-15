## Bank Program - Example One

```c
#include <stdio.h>

void checkBalance(float balance);
float deposit();
float withdraw(float balance);

int main()
{
    
    int choice = 0;
    float balance = 0.0f;
    
    printf("### Welcome To The Bank ###");
    
    do{
        printf("\nSelect an option:\n");
        printf("\nSelect 1. check balance\n");
        printf("\nSelect 2. deposit money\n");
        printf("\nSelect 3. withdraw money\n");
        printf("\nSelect 4. exit\n");
        printf("\nEnter your choice: \n");
        scanf("%d", &choice);
        
        switch(choice){
            case 1: 
                checkBalance(balance);
                break;
            case 2:
                balance = balance + deposit(); // balance += deposit
                break;
            case 3:
                balance = balance - withdraw(balance); // balance -= withdraw
                break;
            case 4:
                printf("Thank you for using the Bank");
                break;
            default:
                printf("You need to choose 1-4");
                break;
        }
        
    }while(choice != 4);

    return 0;
}

void checkBalance(float balance){
    
    printf("Your current baance is: £%.2f\n", balance);
    
}
float deposit(){
    
    float amount = 0.0f;
    
    printf("How much would you like to deposit? £");
    scanf("%f", &amount);
    
    
    return amount;
}
float withdraw(float balance){
    
    float amount = 0.0f;
    
    printf("How much would you like to withdraw? £");
    scanf("%f", &amount);
    
    if(amount < 0){
        printf("Invalid amount\n");
        return 0.0f;
    }
    else if(amount > balance){
        printf("Your balance does not have that much in it");
        return 0.0f;
    }
    else{
        printf("Succesfully withdrew £%.2f\n,", amount);
        return amount;
    }
    
    return 0.0f;
}
```

Next day attempt

```c
#include <stdio.h>

void checkBalance(float balance);
float deposit();
float withdraw(float balance);


int main()
{   
    int choice = 0;
    float balance = 0.0f;
    
    printf("### Welcome To The Bank ###\n");
    printf("Please select 1-4\n");
    
    do{
        printf("select 1. check balance\n");
        printf("select 2. deposit funds\n");
        printf("select 3. withdrew funds\n");
        printf("select 4. exit\n");
        scanf("%d", &choice);
        
    
    
    switch(choice) {
        case 1:
            checkBalance(balance);
            break;
        case 2:
            balance = balance + deposit();
            break;
        case 3:
            balance = balance - withdraw(balance);
            break;
        case 4:
            printf("Thank you for using the bank!\n");
            break;
        default:
            printf("You need to select 1-4\n");
    }
    
    }while(choice != 4);
    
    return 0;
}

void checkBalance(float balance) {

    printf("Your balance is: £%.2f\n", balance);
    
}
float deposit() {
    
    float amount = 0.0f;
    printf("How much would you like to deposit?: £");
    scanf("%f", &amount);
    
    return amount;
}
float withdraw(float balance) {
    
    float amount = 0.0f;
    printf("how much would you like to withdraw?: £");
    scanf("%f", &amount);
    
    return amount;
}
```

## Random numbers 1-20

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    
    int i;
    
    printf("Random Numbers 1-20");
    for(i = 0; i < 8; i++)
        printf("%d\n", (rand()%20)+1);
}
```

With address pointer

```c
#include <stdio.h>

int main() {
    
    int i;
    int *p; 
    p = &i;
    
    printf("Random Numbers 1-20\n");
    for(i = 0; i < 8; i++)
        printf("Adreess is {%p} %d\n", p, (rand()%20)+1);
}
```

## Celsius to Fahrenheit

```c
#include <stdio.h>

// Celcius to Farenheit

int main()
{
    printf("Welcome");
    
    double c = 0.0f;
    double f = 0.0f;
    
    printf("Enter the tempreature in celcius: ");
    scanf("%lf", &c);
    
    f = (c * 1.8) + 32;
    
    printf("The tempreature is %.2lfF", f);
    
    return 0;
}
```

## Removing all occurrences of a character from a string

```c
#include <stdio.h>

// remove character

void remove_char(char *string, char r); // function prototype

int main()
{
    char s1[] = "A string with some words";
    printf("s1 before: %s\n", s1);
    remove_char(s1, 'i');
    printf("s1 after: %s\n", s1);
    
    char s2[] = "AAAaaaxxxAAaaaaaBBBBaaaaaa";
    printf("s2 before: %s\n", s2);
    remove_char(s2, 'a');
    printf("s2 after: %s\n", s2);
    
    return 0;
}

void remove_char(char *string, char r) 
{
    
    int pos = 0;
    
    while (string[pos] != '\0') 
    {
        if (string[pos] == r) 
        {
            int newpos = pos;
            while (string[newpos] != '\0') 
            {
                string[newpos] = string[newpos+1];
                newpos++;
            }
        }
        else pos++;
    }   
}
```

## Remove Trailing Whitespace String Characters

```c
#include <stdio.h>
#include <string.h>

void trim(char *s);

int main()
{   // all strings in in a null terminator: '\0'
    char s[] = "Some string \t\t\n\n "; 
    printf("before: %s\n", s);
    
    trim(s);
    printf("after: %s", s);
    
    return 0;
}

void trim(char *s)
{
    int i = strlen(s) - 1;
    
    while(i > 0)
    {
        if (s[i] == ' ' || s[i] == '\n' || s[i] == '\t') i--;
        else break;
    }
    s[i + 1] = '\0';
}
```

