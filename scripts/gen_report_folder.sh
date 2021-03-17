
mkdir report

mkdir report/sectionA
mkdir report/sectionA/task1


mkdir report/sectionB

mkdir report/sectionC

mkdir report/sectionD


for d in report/** ; do
    touch $d/.gitkeep
done

for d in report/**/*; do
    touch $d/.gitkeep
done