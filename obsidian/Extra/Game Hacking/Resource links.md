Game Hacking GG link to defqon game:
https://github.com/k8pl3r-sh/Gamehacking-DEFCON32
https://gamehacking.gg/

## Multilevel Pointer Template

-> "Points to"

Address = Value = ?
base ptr -> address + offset4 = address
base ptr -> address + offset3 = address
base ptr -> address + offset2 = address
static base -> address + offset1 = address

Example:

-> "Points to"

05D67D98 = Value = 3614
015D88C0 -> 5D67D80 + 0x18 = 05D67D98
015F6868 -> 015D88C0 + 0 = 015D88C0
0155AFA0 -> 15F6850 + 0x18 = 015F6868
"Tutorial-x86_64.exe"+34ECA0 -> 155AF90 + 0x10 = 0155AFA0

Using search hex new scan to find base pointers. At the end, manually add address, add four offsets and input `0x10, 0x18, 0, 0x18`.

Resource: https://www.youtube.com/watch?v=yjdSxL2DWfE&list=PLF7E7487FE8AEA4D2&index=2


