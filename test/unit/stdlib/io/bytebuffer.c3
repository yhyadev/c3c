module bytebuffer_test @test;
import std::io;

fn void! write_read_test()
{
	ByteBuffer buffer;
	buffer.init(0)!;

	buffer.write("hello")!;

	char[8] bytes;
	usz n = buffer.read(bytes[..])!;
	assert(n == 5);
	assert((String)bytes[:n] == "hello");

	buffer.write("hello world")!;
	n = buffer.read(bytes[..])!;
	assert(n == bytes.len);
	assert((String)bytes[:n] == "hello wo");
	assert(buffer.read_idx == 1);

	char c = buffer.read_byte()!;
	assert(c == 'r');
	buffer.pushback_byte()!;

	n = buffer.read(bytes[..])!;
	assert((String)bytes[:n] == "rld");
	assert(buffer.read_idx == 1);
}