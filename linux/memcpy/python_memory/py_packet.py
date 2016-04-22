# -*- coding:utf-8 -*-

import cStringIO
import string
import struct
import sys

PACKET_HEADER_SIZE=13

class Packet(object):
	"""docstring for Packet"""

	_HEAD_LEN_ = PACKET_HEADER_SIZE

	def __init__(self,head_len = PACKET_HEADER_SIZE):
		self._HEAD_LEN_ = head_len
		self.m_len=0
		# self.m_buff=cStringIO.StringIO()
		self.m_buff=""
		self.idx=self._HEAD_LEN_


	def begin(self,cmd,ver=2,subVer=1):
		self.m_buff=cStringIO.StringIO()

		self.m_buff.write("IC")
		self.m_len+=2
		self.put_int16(cmd)
		self.put_chr(chr(ver))
		self.put_chr(chr(subVer))
		for x in xrange(self._HEAD_LEN_-6):
			self.put_chr(chr(0))

	def end(self):
		self.m_buff.seek(6)
		body_len=self.m_len-self._HEAD_LEN_

		self.m_buff.write(chr(body_len & 0xff))
		self.m_buff.write(chr((body_len>>8) & 0xff))

		#move to file EOF
		self.m_buff.seek(0,2)
		self.encryption()
		s=self.m_buff.getvalue()
		self.m_buff.close()
		return s

	def end_without_encry(self):
		self.m_buff.seek(6)
		body_len=self.m_len-self._HEAD_LEN_

		self.m_buff.write(chr(body_len & 0xff))
		self.m_buff.write(chr((body_len>>8) & 0xff))

		#move to file EOF
		self.m_buff.seek(0,2)
		s=self.m_buff.getvalue()
		self.m_buff.close()
		return s

	def beginBY(self,cmd,ver=2,subVer=1):
		self.m_buff=cStringIO.StringIO()

		self.put_chr(chr(0)) #body len
		self.put_chr(chr(0))

		self.m_buff.write("BY")
		self.m_len+=2

		#ver
		self.put_chr(chr(ver))
		self.put_chr(chr(subVer))

		self.put_int16(cmd)

		#co
		self.put_chr(chr(0))

	def endBY(self):
		self.m_buff.seek(0)
		body_len=self.m_len-2

		self.m_buff.write(chr(body_len & 0xff))
		self.m_buff.write(chr((body_len>>8) & 0xff))

		#move to file EOF
		self.m_buff.seek(0,2)
		self.encryption()
		s=self.m_buff.getvalue()
		self.m_buff.close()
		return s

	def get_head_len(self):
		return self._HEAD_LEN_


	def put_chr(self,value):
		self.m_buff.write(value)
		self.m_len+=1


	def put_int(self,value,cnt):
		for x in xrange(cnt):
			self.m_buff.write(chr(value & 0xff))
			value=value>>8


	def put_int8(self,value):
		self.put_int(value,1)
		self.m_len+=1

	
	def put_int16(self,value):
		self.put_int(value,2)
		self.m_len+=2


	def put_int32(self,value):
		self.put_int(value,4)
		self.m_len+=4


	def put_int64(self,value):
		self.put_int(value,8)
		self.m_len+=8


	def put_str(self,value):
		self.put_int32(len(value)+1)
		self.m_buff.write(value)
		self.m_buff.write('\0')
		self.m_len+=(len(value)+1)


	def set_msg(self,msg,len):
		self.m_buff=cStringIO.StringIO()
		self.m_buff.write(msg)
		self.m_len=len
		self.idx=self._HEAD_LEN_
		self.decryption()


	def del_msg(self):
		self.m_buff.close()
		self.m_len=0
		self.idx=self._HEAD_LEN_


	def get_cmd(self):
		self.m_buff.seek(2)
		c1=ord(self.m_buff.read(1))
		self.m_buff.seek(3)
		c2=ord(self.m_buff.read(1))
		cmd=(c2<<8) | c1
		return cmd 


	def get_chr(self):
		self.m_buff.seek(self.idx)
		self.idx+=1
		return self.m_buff.read(1) 


	def get_int(self,cnt):
		c=0
		for x in xrange(cnt):
			self.m_buff.seek(self.idx+cnt-x-1)
			tc=ord(self.m_buff.read(1))
			c=(c<<8) | tc 
		self.idx+=cnt
		return c

	def get_uint16(self):
		return self.get_int(2)

	def get_int16(self):
		self.m_buff.seek(self.idx)
		b0 = ord(self.m_buff.read(1))
		self.idx+=1

		self.m_buff.seek(self.idx)
		b1 = ord(self.m_buff.read(1))
		self.idx+=1

		uint =  (b1 << 8) + b0
		if uint > 2**15-1:
			uint = uint - 2**16
		return uint

	def get_int32(self):
		self.m_buff.seek(self.idx)
		b0 = ord(self.m_buff.read(1))
		self.idx+=1

		self.m_buff.seek(self.idx)
		b1 = ord(self.m_buff.read(1))
		self.idx+=1

		self.m_buff.seek(self.idx)
		b2 = ord(self.m_buff.read(1))
		self.idx+=1

		self.m_buff.seek(self.idx)
		b3 = ord(self.m_buff.read(1))
		self.idx+=1

		uint = (((((b3 << 8) + b2) << 8) + b1) << 8) + b0
		if uint > 2**31-1:
			uint = uint - 2**32
		return uint


	def get_uint32(self):
		return self.get_int(4)

	def get_int64(self):
		return self.get_int(8)


	def get_str(self):
		strlen=self.get_int32()
		self.m_buff.seek(self.idx)
		s=self.m_buff.read(strlen)
		self.idx+=strlen
		return s





		

#test code
if __name__ == "__main__":
	print "test"
	p=Packet()
	print(p.m_len)
	p.begin(0x1001,1,1)
	print(p.m_len)
	p.put_int32(-1)
	print(p.m_len)

	# p.put_int16(3)
	# print(p.m_len)

	# p.put_str("123")
	msg=p.end()
	print(p.m_len)


	inp=Packet()
	inp.set_msg(msg,p.m_len)
	print("0x%x" %inp.get_cmd())
	print(inp.get_int32())
	# print(inp.get_int16())
	# print(inp.get_str())
	inp.del_msg()
	print("head_len=%d" %inp.get_head_len())

	#test for 9 head_len
	print("====================================")
	print("start test for head_len=9 packet")
	request9 = Packet(9)
	request9.begin(0x2001,2,1)
	print("<lineno:%d> head_len=%d" %(sys._getframe().f_lineno,request9.get_head_len()))
	#print sys._getframe().f_back.f_code.co_name
	request9.put_int64(0xAABBCCDDEEFF)
	request9.put_int32(0x00112233445566)
	request9.put_int16(0xEF0F)
	request9.put_chr('a')
	request9.put_str('a')
	msg = request9.end()
	print(request9.m_len)
	response9 = Packet(9)
	response9.set_msg(msg,request9.m_len)
	nCmd = response9.get_cmd()
	nData64 = response9.get_int64()
	nData32 = response9.get_int32()
	nData16 = response9.get_int16()
	nDatachr = response9.get_chr()
	nDatastr = response9.get_str()
	print("cmd:0x%x,nData64=0x%x,nData32=0x%x,nData16=0x%x,nDatachr=%s,nDatastr=%s" %(nCmd,nData64,nData32,nData16,nDatachr,nDatastr))
	print("end test for head_len=9 packet")

