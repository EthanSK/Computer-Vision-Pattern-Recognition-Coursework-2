
mkdir report

mkdir report/sectionA
mkdir report/sectionA/task1
mkdir report/sectionA/task3


mkdir report/sectionB
mkdir report/sectionB/task1
mkdir report/sectionB/task2

mkdir report/sectionC
mkdir report/sectionC/task1a
mkdir report/sectionC/task1b
mkdir report/sectionC/task1d

mkdir report/sectionD
mkdir report/sectionD/task1
mkdir report/sectionD/task2


for d in report/** ; do
    touch $d/.gitkeep
done

for d in report/**/*; do
    touch $d/.gitkeep
done