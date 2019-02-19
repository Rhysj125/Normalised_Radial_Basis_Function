function init()

    close all;
    clear all;
    clc;
    
    global nodeSize;
    global inputs;
    global numOfNodes;
    global trainFile;
    global testFile;
    global iterations;
    global learningRate;
    testFile = csvread('D-M-H-Value testing.csv',1,0);
    trainFile = csvread('D-M-H-Value.csv',1,0);
%     testFile = csvread('nTEST10X');
%     trainFile = csvread('nTRAIN10X');
    inputs = size(trainFile, 2) - 1;
    nodeSize = 0.5;
    numOfNodes = 1;
    iterations = 30;
    learningRate = 0.2;
    
    j = 1:inputs;
    currentX(j) = trainFile(1,j);
    getNewNode(currentX, inputs);

    NRBF();
end