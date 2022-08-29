#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int output[40000];

int compare(char a, char b){
	
	int output = 0;
	
	if(a<b){						//a<b: kein Tausch
		output = -1;
	}
	else if(a>b){					//a>b: Tausch
		output = 1;
	}
	else{							//a=b: kein Tausch
		output = 0;
	}
	return output;
}


 void bubblesort(int a[], int n){
	
	int res = 0;					//res für compare
	int tmp = 0;					//tmp als temporäre Variable für swap
	int tmp2 = 0;					//falls ein Grosbuchtabe
	int tmp3 = 0;					//falls zwei Grossbuchstaben
	
	for(int i=0;i<n-1;i++){
		for(int j=i+1;j<n;j++){
			if((a[i]<=97)&&(a[j]>=97)){
				tmp2 = a[i]+32;
				res = compare(tmp2,a[j]);
				if(res==1){
					tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}
			}
			else if((a[i]>=97)&&(a[j]<=97)){
				tmp2 = a[j]+32;
				res = compare(a[i],tmp2);
				if(res==1){
					tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}
			}
			else if((a[i]<=97)&&(a[j]<=97)){
				res = compare(a[i],a[j]);
				if(res==1){
					tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}
			}
			else{
				res = compare(a[i],a[j]);
				if(res==1){
					tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}
			}
		}
	}
	
	printf("%s", a);
}

int main(){
	
	FILE * file;
	
	file = fopen( "ordered.txt" , "r");
	
	int i = 0;
	
	if (file) {
    	while (fscanf(file, "%d", &output[i])!=EOF) i++;
    	fclose(file);
	}
	
	int n = i-1;
	
	for(int i=0;i<n;i++){
		printf("%d ", output[i]);
	}
	
	clock_t start;
	clock_t end;
	float seconds;
	
	start = clock();
	
	bubblesort(output,n);
	
	end = clock();
	
	seconds = (float)(end - start) / CLOCKS_PER_SEC;
	printf("secs: %f\n", seconds);
}
