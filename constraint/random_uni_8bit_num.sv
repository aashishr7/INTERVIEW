//The code is designed to randomly generate unique 8-bit values and store them in a dynamic queue. It ensures that each generated value is unique until 256 unique values are generated, after which the queue is cleared and the process restarts.
class pkt;
  rand bit [7:0] a;
  bit [7:0] queue[$];
  static int count = 0;

  // Ensure `a` is unique and not in the `queue`
  constraint a_cnst {
    foreach(queue[i]) a != queue[i];
  }

  // `post_randomize()` to update queue after each randomization
  function void post_randomize();
    queue.push_back(a);
    count++;

    // If queue size exceeds 256, reset it
    if (count == 256) begin
      queue.delete();
      count = 0;
    end
  endfunction
endclass

module m;
  pkt p;

  initial begin
    p = new();

    repeat (256) begin
      if (!p.randomize()) 
        $display("Randomization failed.");
      else 
        $display("Generated Value: %0d", p.a);
    end
  end
endmodule
/*
Output
# KERNEL: Generated Value: 0
# KERNEL: Generated Value: 52
# KERNEL: Generated Value: 170
# KERNEL: Generated Value: 163
# KERNEL: Generated Value: 157
# KERNEL: Generated Value: 155
# KERNEL: Generated Value: 234
# KERNEL: Generated Value: 174
# KERNEL: Generated Value: 156
# KERNEL: Generated Value: 65
# KERNEL: Generated Value: 215
# KERNEL: Generated Value: 89
# KERNEL: Generated Value: 207
# KERNEL: Generated Value: 93
# KERNEL: Generated Value: 204
# KERNEL: Generated Value: 105
# KERNEL: Generated Value: 225
# KERNEL: Generated Value: 183
# KERNEL: Generated Value: 224
# KERNEL: Generated Value: 45
# KERNEL: Generated Value: 205
# KERNEL: Generated Value: 47
# KERNEL: Generated Value: 162
# KERNEL: Generated Value: 16
# KERNEL: Generated Value: 34
# KERNEL: Generated Value: 67
# KERNEL: Generated Value: 32
# KERNEL: Generated Value: 168
# KERNEL: Generated Value: 238
# KERNEL: Generated Value: 122
# KERNEL: Generated Value: 243
# KERNEL: Generated Value: 100
# KERNEL: Generated Value: 169
# KERNEL: Generated Value: 38
# KERNEL: Generated Value: 56
# KERNEL: Generated Value: 55
# KERNEL: Generated Value: 86
# KERNEL: Generated Value: 116
# KERNEL: Generated Value: 72
# KERNEL: Generated Value: 5
# KERNEL: Generated Value: 63
# KERNEL: Generated Value: 49
# KERNEL: Generated Value: 136
# KERNEL: Generated Value: 96
# KERNEL: Generated Value: 10
# KERNEL: Generated Value: 212
# KERNEL: Generated Value: 68
# KERNEL: Generated Value: 196
# KERNEL: Generated Value: 151
# KERNEL: Generated Value: 21
# KERNEL: Generated Value: 139
# KERNEL: Generated Value: 57
# KERNEL: Generated Value: 35
# KERNEL: Generated Value: 199
# KERNEL: Generated Value: 108
# KERNEL: Generated Value: 177
# KERNEL: Generated Value: 4
# KERNEL: Generated Value: 120
# KERNEL: Generated Value: 148
# KERNEL: Generated Value: 113
# KERNEL: Generated Value: 1
# KERNEL: Generated Value: 37
# KERNEL: Generated Value: 102
# KERNEL: Generated Value: 203
# KERNEL: Generated Value: 19
# KERNEL: Generated Value: 185
# KERNEL: Generated Value: 134
# KERNEL: Generated Value: 119
# KERNEL: Generated Value: 58
# KERNEL: Generated Value: 18
# KERNEL: Generated Value: 121
# KERNEL: Generated Value: 115
# KERNEL: Generated Value: 252
# KERNEL: Generated Value: 214
# KERNEL: Generated Value: 90
# KERNEL: Generated Value: 173
# KERNEL: Generated Value: 11
# KERNEL: Generated Value: 22
# KERNEL: Generated Value: 62
# KERNEL: Generated Value: 28
# KERNEL: Generated Value: 124
# KERNEL: Generated Value: 247
# KERNEL: Generated Value: 101
# KERNEL: Generated Value: 165
# KERNEL: Generated Value: 112
# KERNEL: Generated Value: 131
# KERNEL: Generated Value: 36
# KERNEL: Generated Value: 103
# KERNEL: Generated Value: 192
# KERNEL: Generated Value: 193
# KERNEL: Generated Value: 216
# KERNEL: Generated Value: 61
# KERNEL: Generated Value: 81
# KERNEL: Generated Value: 159
# KERNEL: Generated Value: 114
# KERNEL: Generated Value: 17
# KERNEL: Generated Value: 31
# KERNEL: Generated Value: 189
# KERNEL: Generated Value: 15
# KERNEL: Generated Value: 130
# KERNEL: Generated Value: 190
# KERNEL: Generated Value: 14
# KERNEL: Generated Value: 222
# KERNEL: Generated Value: 143
# KERNEL: Generated Value: 83
# KERNEL: Generated Value: 236
# KERNEL: Generated Value: 127
# KERNEL: Generated Value: 166
# KERNEL: Generated Value: 94
# KERNEL: Generated Value: 242
# KERNEL: Generated Value: 150
# KERNEL: Generated Value: 20
# KERNEL: Generated Value: 253
# KERNEL: Generated Value: 60
# KERNEL: Generated Value: 149
# KERNEL: Generated Value: 146
# KERNEL: Generated Value: 209
# KERNEL: Generated Value: 191
# KERNEL: Generated Value: 70
# KERNEL: Generated Value: 46
# KERNEL: Generated Value: 54
# KERNEL: Generated Value: 110
# KERNEL: Generated Value: 186
# KERNEL: Generated Value: 87
# KERNEL: Generated Value: 43
# KERNEL: Generated Value: 208
# KERNEL: Generated Value: 223
# KERNEL: Generated Value: 2
# KERNEL: Generated Value: 91
# KERNEL: Generated Value: 9
# KERNEL: Generated Value: 29
# KERNEL: Generated Value: 246
# KERNEL: Generated Value: 42
# KERNEL: Generated Value: 178
# KERNEL: Generated Value: 137
# KERNEL: Generated Value: 187
# KERNEL: Generated Value: 7
# KERNEL: Generated Value: 221
# KERNEL: Generated Value: 27
# KERNEL: Generated Value: 250
# KERNEL: Generated Value: 74
# KERNEL: Generated Value: 158
# KERNEL: Generated Value: 147
# KERNEL: Generated Value: 195
# KERNEL: Generated Value: 128
# KERNEL: Generated Value: 201
# KERNEL: Generated Value: 167
# KERNEL: Generated Value: 99
# KERNEL: Generated Value: 202
# KERNEL: Generated Value: 179
# KERNEL: Generated Value: 160
# KERNEL: Generated Value: 194
# KERNEL: Generated Value: 175
# KERNEL: Generated Value: 211
# KERNEL: Generated Value: 254
# KERNEL: Generated Value: 88
# KERNEL: Generated Value: 95
# KERNEL: Generated Value: 44
# KERNEL: Generated Value: 39
# KERNEL: Generated Value: 164
# KERNEL: Generated Value: 126
# KERNEL: Generated Value: 69
# KERNEL: Generated Value: 226
# KERNEL: Generated Value: 219
# KERNEL: Generated Value: 59
# KERNEL: Generated Value: 197
# KERNEL: Generated Value: 51
# KERNEL: Generated Value: 133
# KERNEL: Generated Value: 233
# KERNEL: Generated Value: 23
# KERNEL: Generated Value: 98
# KERNEL: Generated Value: 144
# KERNEL: Generated Value: 206
# KERNEL: Generated Value: 92
# KERNEL: Generated Value: 154
# KERNEL: Generated Value: 188
# KERNEL: Generated Value: 245
# KERNEL: Generated Value: 229
# KERNEL: Generated Value: 140
# KERNEL: Generated Value: 218
# KERNEL: Generated Value: 80
# KERNEL: Generated Value: 82
# KERNEL: Generated Value: 85
# KERNEL: Generated Value: 145
# KERNEL: Generated Value: 123
# KERNEL: Generated Value: 255
# KERNEL: Generated Value: 111
# KERNEL: Generated Value: 249
# KERNEL: Generated Value: 213
# KERNEL: Generated Value: 117
# KERNEL: Generated Value: 33
# KERNEL: Generated Value: 118
# KERNEL: Generated Value: 109
# KERNEL: Generated Value: 135
# KERNEL: Generated Value: 66
# KERNEL: Generated Value: 25
# KERNEL: Generated Value: 77
# KERNEL: Generated Value: 176
# KERNEL: Generated Value: 217
# KERNEL: Generated Value: 129
# KERNEL: Generated Value: 64
# KERNEL: Generated Value: 200
# KERNEL: Generated Value: 138
# KERNEL: Generated Value: 227
# KERNEL: Generated Value: 172
# KERNEL: Generated Value: 180
# KERNEL: Generated Value: 171
# KERNEL: Generated Value: 12
# KERNEL: Generated Value: 198
# KERNEL: Generated Value: 230
# KERNEL: Generated Value: 78
# KERNEL: Generated Value: 41
# KERNEL: Generated Value: 75
# KERNEL: Generated Value: 231
# KERNEL: Generated Value: 76
# KERNEL: Generated Value: 232
# KERNEL: Generated Value: 6
# KERNEL: Generated Value: 210
# KERNEL: Generated Value: 8
# KERNEL: Generated Value: 40
# KERNEL: Generated Value: 237
# KERNEL: Generated Value: 244
# KERNEL: Generated Value: 141
# KERNEL: Generated Value: 142
# KERNEL: Generated Value: 125
# KERNEL: Generated Value: 239
# KERNEL: Generated Value: 73
# KERNEL: Generated Value: 50
# KERNEL: Generated Value: 240
# KERNEL: Generated Value: 228
# KERNEL: Generated Value: 132
# KERNEL: Generated Value: 107
# KERNEL: Generated Value: 84
# KERNEL: Generated Value: 248
# KERNEL: Generated Value: 13
# KERNEL: Generated Value: 220
# KERNEL: Generated Value: 153
# KERNEL: Generated Value: 161
# KERNEL: Generated Value: 26
# KERNEL: Generated Value: 241
# KERNEL: Generated Value: 30
# KERNEL: Generated Value: 251
# KERNEL: Generated Value: 53
# KERNEL: Generated Value: 152
# KERNEL: Generated Value: 181
# KERNEL: Generated Value: 71
# KERNEL: Generated Value: 97
# KERNEL: Generated Value: 3
# KERNEL: Generated Value: 48
# KERNEL: Generated Value: 104
# KERNEL: Generated Value: 182
# KERNEL: Generated Value: 184
# KERNEL: Generated Value: 79
# KERNEL: Generated Value: 235
# KERNEL: Generated Value: 24
# KERNEL: Generated Value: 106
# KERNEL: Simulation has finished. There are no more test vectors to simulate. */
