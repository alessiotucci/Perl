#include <stdlib.h>
#include <unistd.h>

// Function to find the newline character in a string
static char *findNewline(char * memory)
{
	int index = 0;

	if (memory == NULL)
		return NULL;
	while(memory[index])
	{
		if (memory[index] == '\n')
			return (memory + index);
		index++;
	}
	return NULL;
}
// Function to append a buffer to a memory block
static char *appendBuffer(char *memory, char *buffer)
{
	int memoryLength = 0;
	int bufferLength = 0;
	char *result;

	if (memory == NULL && (buffer == NULL || *buffer == '\0'))
		return NULL;
	if (memory != NULL)
	{
		while (memory[memoryLength])
			memoryLength++;
	}
	while (buffer[bufferLength])
		bufferLength++;
	result = malloc((memoryLength + bufferLength + 1) * sizeof(char));
	if (result == NULL)
		return NULL;
	result[memoryLength + bufferLength] = '\0';
	// Copy buffer to result
	// Copy buffer to result
	int i = bufferLength - 1;
	while(i >= 0)
	{
		result[memoryLength + i] = buffer[i];
		i--;
	}
	// Copy memory to result
	i = memoryLength - 1;
	while(i >= 0)
	{
		result[i] = memory[i];
		i--;
	}
	free(memory);
	return result;
}
// Function to extract a line from a memory block
static char *extractLine(char *memory)
{
	int index = 0;
	char * result;

	if (memory == NULL)
		return NULL;
	while (memory[index] && memory[index] != '\n')
		index++;
	result = malloc((index + 2) * sizeof(char));
	if (result == NULL)
		return NULL;
	index = 0;
	while (memory[index] && memory[index] != '\n')
	{
		result[index] = memory[index];
		index++;
	}
	if (memory[index] == '\n')
		result[index++] = '\n';
	result[index] = '\0';
	return result;
}
// Function to remove a line from a memory block
static char *removeLine(char *memory)
{
	int startIndex = 0;
	int endIndex = 0;
	char *result;

	if (memory == NULL)
		return NULL;
	while (memory[startIndex] && memory[startIndex] != '\n')
		startIndex++;
	startIndex++;
	if (memory[startIndex] == '\0')
	{
		free(memory);
		return NULL;
	}
	while (memory[endIndex])
		endIndex++;
	result = malloc((endIndex - startIndex + 1) * sizeof(char));
	if (result == NULL)
		return NULL;
	endIndex = 0;
	while (memory[startIndex])
		result[endIndex++] = memory[startIndex++];
	result[endIndex] = '\0';
	free(memory);
	return result;
}
// Function to get a line from a file descriptor
char *getLine(int fileDescriptor)
{
	int bytesRead = 1;
	char *buffer;
	char *line;
	static char *memory;

	if (fileDescriptor < 0 || BUFF_SIZE <= 0)
		return NULL;
	buffer = malloc((BUFF_SIZE +1) * sizeof(char));
	if (buffer == NULL)
		return NULL;
	while (findNewline(memory) == NULL && bytesRead != 0)
	{
		bytesRead = read(fileDescriptor, buffer, BUFF_SIZE);
		if( bytesRead < 0)
		{
			free(buffer);
			return NULL;
		}
		buffer[bytesRead] = '\0';
		memory = appendBuffer(memory, buffer);
	}
	line = extractLine(memory);
	memory = removeLine(memory);
	// missing to free probably...
	return line;
}
