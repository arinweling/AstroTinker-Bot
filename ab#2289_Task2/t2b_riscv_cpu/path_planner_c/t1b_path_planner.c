
/*
* AstroTinker Bot (AB): Task 1B Path Planner
*
* This program computes the valid path from the start point to the end point.
* Make sure you don't change anything outside the "Add your code here" section.
* Updated memory addresses for Task 2B
*/

#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#ifdef __linux__ // for host pc

    #include <stdio.h>

    void _put_byte(char c) { putchar(c); }

    void _put_str(char *str) {
        while (*str) {
            _put_byte(*str++);
        }
    }

    void print_output(uint8_t num) {
        if (num == 0) {
            putchar('0'); // if the number is 0, directly print '0'
            _put_byte('\n');
            return;
        }

        if (num < 0) {
            putchar('-'); // print the negative sign for negative numbers
            num = -num;   // make the number positive for easier processing
        }

        // convert the integer to a string
        char buffer[20]; // assuming a 32-bit integer, the maximum number of digits is 10 (plus sign and null terminator)
        uint8_t index = 0;

        while (num > 0) {
            buffer[index++] = '0' + num % 10; // convert the last digit to its character representation
            num /= 10;                        // move to the next digit
        }

        // print the characters in reverse order (from right to left)
        while (index > 0) { putchar(buffer[--index]); }
        _put_byte('\n');
    }

    void _put_value(uint8_t val) { print_output(val); }

#else  // for the test device

    void _put_value(uint8_t val) { }
    void _put_str(char *str) { }

#endif

/*
Functions Usage

instead of using printf() function for debugging,
use the below function calls to print a number, string or a newline

for newline: _put_byte('\n');
for string:  _put_str("your string here");
for number:  _put_value(your_number_here);

Examples:
        _put_value(START_POINT);
        _put_value(END_POINT);
        _put_str("Hello World!");
        _put_byte('\n');

*/

// main function
int main(int argc, char const *argv[]) {

    #ifdef __linux__

        const uint8_t START_POINT   = atoi(argv[1]);
        const uint8_t END_POINT     = atoi(argv[2]);
        uint8_t NODE_POINT          = 0;
        uint8_t CPU_DONE            = 0;

    #else
        // Address value of variables are updated for RISC-V Implementation
        #define START_POINT         (* (volatile uint8_t * ) 0x02000000)
        #define END_POINT           (* (volatile uint8_t * ) 0x02000004)
        #define NODE_POINT          (* (volatile uint8_t * ) 0x02000008)
        #define CPU_DONE            (* (volatile uint8_t * ) 0x0200000c)

    #endif

    // array to store the planned path
    uint8_t path_planned[32];
    // index to keep track of the path_planned array
    uint8_t idx = 0;

    // ############# Add your code here #############

int start=START_POINT;
    int end=END_POINT;
    // printf("Enter start :");
    // scanf("%d",&start);
    // printf("Enter end:");
    // scanf("%d",&end);
    int arr_map[30][5]={{1,69},{0,2,29,69},{3,1,8,69},{2,4,28,69},{3,5,6,69},{4,69},{4,7,69},{6,8,69},{2,9,12,7,69},{8,10,11,69},
    {9,69},{9,69},{8,19,13,69},{12,14,69},{15,13,16,69},{14,69},{14,17,18,69},{16,69},{19,16,69},{20,12,18,69},{21,29,24,19,69},
    {20,22,23,69},{21,69},{21,69},{20,25,69},{26,24,69},{25,27,28,69},{26,69},{26,29,3,69},{20,28,1,69}};
    int map[30]={0};
    map[end]=1;
    int distance=1;
    while(map[start]==0){
        for(int j=0;j<=29;j++){
            if(map[j]==distance){
            int i=0;
            while(arr_map[j][i]!=69){
            if(map[arr_map[j][i]]==0){
            map[arr_map[j][i]]=distance+1;}
            i++;
        }
            }
        }
        distance++;

    }
    // printf("Start distance from end = %d \n",map[start]);
    int final_dist=map[start];
    idx=map[start];
    path_planned[0]=start;
    path_planned[idx-1]=end;
    int counter=1;
    int next_node=start;
    while(next_node!=end){
        int k=0;
        while(arr_map[next_node][k]!=69){
            if ((map[arr_map[next_node][k]])==final_dist-1){
                next_node=arr_map[next_node][k];
                path_planned[counter]=next_node;
                counter++;
                final_dist--;
                break;
            }
            k++;

        }
    }

    // ##############################################

    // the node values are written into data memory sequentially.
    // for (int i = 0; i < idx; ++i) {
    //     NODE_POINT = path_planned[i];
        

    // }
    volatile uint8_t *temp_pointer = &NODE_POINT;

for (int i = 0; i < idx; ++i) {
    *temp_pointer = path_planned[i];
    temp_pointer++;  // Move to the next memory address
}

    // Assuming NODE_POINT is the starting memory address
// volatile uint8_t *memory_address = &NODE_POINT;

// for (int i = 0; i < idx; ++i) {
//     // Write the value to the current memory address
//     *memory_address = path_planned[i];
    
//     // Move to the next memory address
//     memory_address++;
// }
    // Path Planning Computation Done Flag
    CPU_DONE = 1;

    #ifdef __linux__    // for host pc

        _put_str("######### Planned Path #########\n");
        for (int i = 0; i < idx; ++i) {
            _put_value(path_planned[i]);
        }
        _put_str("################################\n");

    #endif

    return 0;
}

