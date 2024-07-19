
**Binary To Decimal**

| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- |


- Add numbers over the table 
- If 1 then it's on so write down the number
- If 0 it's off so just skip it 
- Add up the final numbers gives our entry

Example:


| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1   | 1   | 0   | 0   | 0   | 0   | 0   | 0   |
Would be equal to:
128+64=192
- This is the first part of our private home ip address

**Decimal To Binary**

Starting with 172.16.34.3


| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- |

We try to minus 172 with 128 if it will then we use the remainder and go down the line to determine which are on and which are off, subtracting along the way.

Example:

172 - 128 = 44 **ON**
44 - 64 x **OFF**
44 - 32 = 12 **ON**
12 - 16 x **OFF**
12 - 8 = 4 **ON**
4 - 4 = 0 **ON**
**OFF**
**OFF**

So 172 = 10101100