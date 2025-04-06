FROM ubuntu AS stage1

COPY ./hello.cpp /
RUN apt update -y &&\
	apt list --upgradable &&\
	apt install -y build-essential &&\
	g++ hello.cpp

FROM ubuntu AS stage2

COPY --from=stage1 /a.out /
CMD ["/a.out"]
