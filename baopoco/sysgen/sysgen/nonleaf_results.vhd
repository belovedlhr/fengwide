library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/a0p0_1st_shift"

entity a0p0_1st_shift_entity_6b28cbec7c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din1: in std_logic_vector(17 downto 0); 
    din2: in std_logic_vector(17 downto 0); 
    din3: in std_logic_vector(17 downto 0); 
    din4: in std_logic_vector(17 downto 0); 
    sync_in: in std_logic; 
    dout1: out std_logic_vector(17 downto 0); 
    dout2: out std_logic_vector(17 downto 0); 
    dout3: out std_logic_vector(17 downto 0); 
    dout4: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end a0p0_1st_shift_entity_6b28cbec7c;

architecture structural of a0p0_1st_shift_entity_6b28cbec7c is
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal convert_1_1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_1_2_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_1_3_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_1_4_dout_net_x0: std_logic_vector(17 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal delay_q_net_x0: std_logic;
  signal shift1_op_net_x0: std_logic_vector(17 downto 0);
  signal shift2_op_net_x0: std_logic_vector(17 downto 0);
  signal shift3_op_net_x0: std_logic_vector(17 downto 0);
  signal shift4_op_net_x0: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  convert_1_1_dout_net_x0 <= din1;
  convert_1_2_dout_net_x0 <= din2;
  convert_1_3_dout_net_x0 <= din3;
  convert_1_4_dout_net_x0 <= din4;
  delay1_q_net_x0 <= sync_in;
  dout1 <= shift3_op_net_x0;
  dout2 <= shift1_op_net_x0;
  dout3 <= shift2_op_net_x0;
  dout4 <= shift4_op_net_x0;
  sync_out <= delay_q_net_x0;

  delay: entity work.delay_0341f7be44
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => delay1_q_net_x0,
      q(0) => delay_q_net_x0
    );

  shift1: entity work.shift_01a2ba5449
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => convert_1_2_dout_net_x0,
      op => shift1_op_net_x0
    );

  shift2: entity work.shift_01a2ba5449
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => convert_1_3_dout_net_x0,
      op => shift2_op_net_x0
    );

  shift3: entity work.shift_01a2ba5449
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => convert_1_1_dout_net_x0,
      op => shift3_op_net_x0
    );

  shift4: entity work.shift_01a2ba5449
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => convert_1_4_dout_net_x0,
      op => shift4_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/acc_ctrl/posedge1"

entity posedge1_entity_db6dbfef24 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end posedge1_entity_db6dbfef24;

architecture structural of posedge1_entity_db6dbfef24 is
  signal ce_1_sg_x4: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal delay_q_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;

begin
  ce_1_sg_x4 <= ce_1;
  clk_1_sg_x4 <= clk_1;
  register_q_net_x0 <= in_x0;
  out_x0 <= logical_y_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d(0) => register_q_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      ip(0) => delay_q_net,
      op(0) => inverter_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => register_q_net_x0,
      y(0) => logical_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/acc_ctrl"

entity acc_ctrl_entity_d11c827fe8 is
  port (
    acc_len: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    mrst: in std_logic; 
    sync: in std_logic; 
    new_acc: out std_logic
  );
end acc_ctrl_entity_d11c827fe8;

architecture structural of acc_ctrl_entity_d11c827fe8 is
  signal baopoco_acc_len_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x7: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal cntr_op_net: std_logic_vector(31 downto 0);
  signal delay1_q_net_x1: std_logic;
  signal delay4_q_net_x0: std_logic;
  signal delay_q_net: std_logic_vector(31 downto 0);
  signal logical_y_net: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x1: std_logic;
  signal logical_y_net_x3: std_logic;
  signal register_q_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;
  signal shift_op_net: std_logic_vector(31 downto 0);

begin
  baopoco_acc_len_user_data_out_net_x0 <= acc_len;
  ce_1_sg_x7 <= ce_1;
  clk_1_sg_x7 <= clk_1;
  delay1_q_net_x1 <= mrst;
  delay4_q_net_x0 <= sync;
  new_acc <= logical_y_net_x3;

  cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_80bc1d6adf842981",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      en => "1",
      rst(0) => logical_y_net,
      op => cntr_op_net
    );

  delay: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      d => shift_op_net,
      q => delay_q_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => relational5_op_net_x0,
      y(0) => logical_y_net
    );

  posedge1_db6dbfef24: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in_x0 => register_q_net_x0,
      out_x0 => logical_y_net_x0
    );

  posedge2_2806572686: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in_x0 => delay1_q_net_x1,
      out_x0 => logical_y_net_x1
    );

  posedge3_0e9ac2a691: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in_x0 => relational5_op_net_x0,
      out_x0 => logical_y_net_x3
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => delay4_q_net_x0,
      en(0) => delay4_q_net_x0,
      rst(0) => logical_y_net_x1,
      q(0) => register_q_net_x0
    );

  relational5: entity work.relational_8782e16b67
    port map (
      a => cntr_op_net,
      b => delay_q_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net_x0
    );

  shift: entity work.shift_7cc6eff90a
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      ip => baopoco_acc_len_user_data_out_net_x0,
      op => shift_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/acc_num"

entity acc_num_entity_e7d623cae3 is
  port (
    reg_out: in std_logic_vector(31 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end acc_num_entity_e7d623cae3;

architecture structural of acc_num_entity_e7d623cae3 is
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);
  signal counter1_op_net_x0: std_logic_vector(31 downto 0);

begin
  counter1_op_net_x0 <= reg_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => counter1_op_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/adc/conv"

entity conv_entity_c798f5dee1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)
  );
end conv_entity_c798f5dee1;

architecture structural of conv_entity_c798f5dee1 is
  signal baopoco_adc_user_datai0_net_x0: std_logic_vector(7 downto 0);
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal concat_y_net: std_logic_vector(7 downto 0);
  signal inverter_op_net: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net: std_logic_vector(6 downto 0);
  signal slice_y_net: std_logic;

begin
  ce_1_sg_x8 <= ce_1;
  clk_1_sg_x8 <= clk_1;
  baopoco_adc_user_datai0_net_x0 <= in1;
  out1 <= reinterpret_output_port_net_x0;

  concat: entity work.concat_83e473517e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => inverter_op_net,
      in1 => slice1_y_net,
      y => concat_y_net
    );

  inverter: entity work.inverter_e2b989a05e
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      ip(0) => slice_y_net,
      op(0) => inverter_op_net
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => reinterpret_output_port_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 7,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => baopoco_adc_user_datai0_net_x0,
      y(0) => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 6,
      x_width => 8,
      y_width => 7
    )
    port map (
      x => baopoco_adc_user_datai0_net_x0,
      y => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/adc"

entity adc_entity_9e0b1c0f18 is
  port (
    baopoco_adc_user_datai0: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_datai1: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_datai2: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_datai3: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq0: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq1: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq2: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq3: in std_logic_vector(7 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i0: out std_logic_vector(7 downto 0); 
    i1: out std_logic_vector(7 downto 0); 
    i2: out std_logic_vector(7 downto 0); 
    i3: out std_logic_vector(7 downto 0); 
    q0: out std_logic_vector(7 downto 0); 
    q1: out std_logic_vector(7 downto 0); 
    q2: out std_logic_vector(7 downto 0); 
    q3: out std_logic_vector(7 downto 0)
  );
end adc_entity_9e0b1c0f18;

architecture structural of adc_entity_9e0b1c0f18 is
  signal baopoco_adc_user_datai0_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_datai1_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_datai2_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_datai3_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq0_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq1_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq2_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq3_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x16: std_logic;
  signal clk_1_sg_x16: std_logic;
  signal reinterpret_output_port_net_x10: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x11: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(7 downto 0);

begin
  baopoco_adc_user_datai0_net_x1 <= baopoco_adc_user_datai0;
  baopoco_adc_user_datai1_net_x1 <= baopoco_adc_user_datai1;
  baopoco_adc_user_datai2_net_x1 <= baopoco_adc_user_datai2;
  baopoco_adc_user_datai3_net_x1 <= baopoco_adc_user_datai3;
  baopoco_adc_user_dataq0_net_x1 <= baopoco_adc_user_dataq0;
  baopoco_adc_user_dataq1_net_x1 <= baopoco_adc_user_dataq1;
  baopoco_adc_user_dataq2_net_x1 <= baopoco_adc_user_dataq2;
  baopoco_adc_user_dataq3_net_x1 <= baopoco_adc_user_dataq3;
  ce_1_sg_x16 <= ce_1;
  clk_1_sg_x16 <= clk_1;
  i0 <= reinterpret_output_port_net_x8;
  i1 <= reinterpret_output_port_net_x9;
  i2 <= reinterpret_output_port_net_x10;
  i3 <= reinterpret_output_port_net_x11;
  q0 <= reinterpret_output_port_net_x12;
  q1 <= reinterpret_output_port_net_x13;
  q2 <= reinterpret_output_port_net_x14;
  q3 <= reinterpret_output_port_net_x15;

  conv1_1567da456b: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_datai1_net_x1,
      out1 => reinterpret_output_port_net_x9
    );

  conv2_845e7d04e9: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x10
    );

  conv3_6d6234d413: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_datai3_net_x1,
      out1 => reinterpret_output_port_net_x11
    );

  conv4_f742693b05: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_dataq0_net_x1,
      out1 => reinterpret_output_port_net_x12
    );

  conv5_75a9480adf: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_dataq1_net_x1,
      out1 => reinterpret_output_port_net_x13
    );

  conv6_fb732103d4: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_dataq2_net_x1,
      out1 => reinterpret_output_port_net_x14
    );

  conv7_0f38cfc2a1: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_dataq3_net_x1,
      out1 => reinterpret_output_port_net_x15
    );

  conv_c798f5dee1: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x16,
      clk_1 => clk_1_sg_x16,
      in1 => baopoco_adc_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/adc1"

entity adc1_entity_70310c336e is
  port (
    baopoco_adc1_user_datai0: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_datai1: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_datai2: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_datai3: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq0: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq1: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq2: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq3: in std_logic_vector(7 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i0: out std_logic_vector(7 downto 0); 
    i1: out std_logic_vector(7 downto 0); 
    i2: out std_logic_vector(7 downto 0); 
    i3: out std_logic_vector(7 downto 0); 
    q0: out std_logic_vector(7 downto 0); 
    q1: out std_logic_vector(7 downto 0); 
    q2: out std_logic_vector(7 downto 0); 
    q3: out std_logic_vector(7 downto 0)
  );
end adc1_entity_70310c336e;

architecture structural of adc1_entity_70310c336e is
  signal baopoco_adc1_user_datai0_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_datai1_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_datai2_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_datai3_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq0_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq1_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq2_net_x1: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq3_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x25: std_logic;
  signal clk_1_sg_x25: std_logic;
  signal reinterpret_output_port_net_x10: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x11: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(7 downto 0);

begin
  baopoco_adc1_user_datai0_net_x1 <= baopoco_adc1_user_datai0;
  baopoco_adc1_user_datai1_net_x1 <= baopoco_adc1_user_datai1;
  baopoco_adc1_user_datai2_net_x1 <= baopoco_adc1_user_datai2;
  baopoco_adc1_user_datai3_net_x1 <= baopoco_adc1_user_datai3;
  baopoco_adc1_user_dataq0_net_x1 <= baopoco_adc1_user_dataq0;
  baopoco_adc1_user_dataq1_net_x1 <= baopoco_adc1_user_dataq1;
  baopoco_adc1_user_dataq2_net_x1 <= baopoco_adc1_user_dataq2;
  baopoco_adc1_user_dataq3_net_x1 <= baopoco_adc1_user_dataq3;
  ce_1_sg_x25 <= ce_1;
  clk_1_sg_x25 <= clk_1;
  i0 <= reinterpret_output_port_net_x8;
  i1 <= reinterpret_output_port_net_x9;
  i2 <= reinterpret_output_port_net_x10;
  i3 <= reinterpret_output_port_net_x11;
  q0 <= reinterpret_output_port_net_x12;
  q1 <= reinterpret_output_port_net_x13;
  q2 <= reinterpret_output_port_net_x14;
  q3 <= reinterpret_output_port_net_x15;

  conv1_5c4642156e: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_datai1_net_x1,
      out1 => reinterpret_output_port_net_x9
    );

  conv2_dd0d9b2fff: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x10
    );

  conv3_a11f72562c: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_datai3_net_x1,
      out1 => reinterpret_output_port_net_x11
    );

  conv4_0388ada25b: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_dataq0_net_x1,
      out1 => reinterpret_output_port_net_x12
    );

  conv5_45fcbafee2: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_dataq1_net_x1,
      out1 => reinterpret_output_port_net_x13
    );

  conv6_755cf01ad2: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_dataq2_net_x1,
      out1 => reinterpret_output_port_net_x14
    );

  conv7_5a5790e65e: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_dataq3_net_x1,
      out1 => reinterpret_output_port_net_x15
    );

  conv_fa59b282cb: entity work.conv_entity_c798f5dee1
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in1 => baopoco_adc1_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/adc_sum0"

entity adc_sum0_entity_d6bc62b516 is
  port (
    reg_out: in std_logic_vector(23 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end adc_sum0_entity_d6bc62b516;

architecture structural of adc_sum0_entity_d6bc62b516 is
  signal convert2_dout_net_x0: std_logic_vector(23 downto 0);
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);

begin
  convert2_dout_net_x0 <= reg_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 24,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => convert2_dout_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/adc_unpack0"

entity adc_unpack0_entity_3a91f4ad2d is
  port (
    in1: in std_logic_vector(31 downto 0); 
    out1: out std_logic_vector(7 downto 0); 
    out2: out std_logic_vector(7 downto 0); 
    out3: out std_logic_vector(7 downto 0); 
    out4: out std_logic_vector(7 downto 0)
  );
end adc_unpack0_entity_3a91f4ad2d;

architecture structural of adc_unpack0_entity_3a91f4ad2d is
  signal delay_q_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice6_y_net: std_logic_vector(7 downto 0);
  signal slice7_y_net: std_logic_vector(7 downto 0);
  signal slice8_y_net: std_logic_vector(7 downto 0);
  signal slice9_y_net: std_logic_vector(7 downto 0);

begin
  delay_q_net_x0 <= in1;
  out1 <= reinterpret_output_port_net_x0;
  out2 <= reinterpret1_output_port_net_x0;
  out3 <= reinterpret2_output_port_net_x0;
  out4 <= reinterpret3_output_port_net_x0;

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice9_y_net,
      output_port => reinterpret_output_port_net_x0
    );

  reinterpret1: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice8_y_net,
      output_port => reinterpret1_output_port_net_x0
    );

  reinterpret2: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice7_y_net,
      output_port => reinterpret2_output_port_net_x0
    );

  reinterpret3: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice6_y_net,
      output_port => reinterpret3_output_port_net_x0
    );

  slice6: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x0,
      y => slice6_y_net
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x0,
      y => slice7_y_net
    );

  slice8: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 23,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x0,
      y => slice8_y_net
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 31,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x0,
      y => slice9_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/calc_adc_sum_sq/negedge"

entity negedge_entity_10ea0ea19c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out1: out std_logic
  );
end negedge_entity_10ea0ea19c;

architecture structural of negedge_entity_10ea0ea19c is
  signal ce_1_sg_x26: std_logic;
  signal clk_1_sg_x26: std_logic;
  signal convert_dout_net_x0: std_logic;
  signal delay_q_net: std_logic;
  signal inverter1_op_net: std_logic;
  signal logical_y_net: std_logic;
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x26 <= ce_1;
  clk_1_sg_x26 <= clk_1;
  slice_y_net_x0 <= in_x0;
  out1 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => logical_y_net,
      dout(0) => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x26,
      clk => clk_1_sg_x26,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  inverter1: entity work.inverter_e2b989a05e
    port map (
      ce => ce_1_sg_x26,
      clk => clk_1_sg_x26,
      clr => '0',
      ip(0) => slice_y_net_x0,
      op(0) => inverter1_op_net
    );

  logical: entity work.logical_938d99ac11
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net,
      d1(0) => inverter1_op_net,
      y(0) => logical_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/calc_adc_sum_sq"

entity calc_adc_sum_sq_entity_42d21d7c12 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    in2: in std_logic_vector(7 downto 0); 
    in3: in std_logic_vector(7 downto 0); 
    in4: in std_logic_vector(7 downto 0); 
    sum: out std_logic_vector(23 downto 0); 
    sum_sq: out std_logic_vector(31 downto 0)
  );
end calc_adc_sum_sq_entity_42d21d7c12;

architecture structural of calc_adc_sum_sq_entity_42d21d7c12 is
  signal accumulator1_q_net: std_logic_vector(23 downto 0);
  signal accumulator_q_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x27: std_logic;
  signal clk_1_sg_x27: std_logic;
  signal convert1_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(23 downto 0);
  signal convert_dout_net_x0: std_logic;
  signal counter1_op_net: std_logic_vector(15 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net: std_logic_vector(7 downto 0);
  signal mult_p_net: std_logic_vector(15 downto 0);
  signal mux_y_net: std_logic_vector(7 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x27 <= ce_1;
  clk_1_sg_x27 <= clk_1;
  reinterpret2_output_port_net_x0 <= in1;
  reinterpret1_output_port_net_x0 <= in2;
  reinterpret3_output_port_net_x0 <= in3;
  reinterpret4_output_port_net_x0 <= in4;
  sum <= convert2_dout_net_x1;
  sum_sq <= convert1_dout_net_x1;

  accumulator: entity work.accum_5de67d2060
    port map (
      b => mult_p_net,
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      clr => '0',
      rst(0) => convert_dout_net_x0,
      q => accumulator_q_net
    );

  accumulator1: entity work.accum_22ff2585dd
    port map (
      b => delay_q_net,
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      clr => '0',
      rst(0) => convert_dout_net_x0,
      q => accumulator1_q_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => register_q_net,
      dout => convert1_dout_net_x1
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 24,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => register1_q_net,
      dout => convert2_dout_net_x1
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_fb8caae5ebc5d253",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  counter1: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_9b19b69f1946892e",
      op_arith => xlUnsigned,
      op_width => 16
    )
    port map (
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter1_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      d => mux_y_net,
      en => '1',
      q => delay_q_net
    );

  mult: entity work.mult_98e3c7048f
    port map (
      a => mux_y_net,
      b => mux_y_net,
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      clr => '0',
      p => mult_p_net
    );

  mux: entity work.mux_81f00cece7
    port map (
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      clr => '0',
      d0 => reinterpret2_output_port_net_x0,
      d1 => reinterpret3_output_port_net_x0,
      d2 => reinterpret1_output_port_net_x0,
      d3 => reinterpret4_output_port_net_x0,
      sel => counter_op_net,
      y => mux_y_net
    );

  negedge_10ea0ea19c: entity work.negedge_entity_10ea0ea19c
    port map (
      ce_1 => ce_1_sg_x27,
      clk_1 => clk_1_sg_x27,
      in_x0 => slice_y_net_x0,
      out1 => convert_dout_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      d => accumulator1_q_net,
      en(0) => convert_dout_net_x0,
      rst => "0",
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      d => accumulator_q_net,
      en(0) => convert_dout_net_x0,
      rst => "0",
      q => register_q_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 15,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => counter1_op_net,
      y(0) => slice_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/clip_detect"

entity clip_detect_entity_02e572e7fb is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_01: in std_logic; 
    in_02: in std_logic; 
    in_03: in std_logic; 
    in_04: in std_logic; 
    in_05: in std_logic; 
    in_06: in std_logic; 
    in_07: in std_logic; 
    in_08: in std_logic; 
    in_09: in std_logic; 
    in_10: in std_logic; 
    in_11: in std_logic; 
    in_12: in std_logic; 
    in_13: in std_logic; 
    in_14: in std_logic; 
    in_15: in std_logic; 
    in_16: in std_logic; 
    in_17: in std_logic; 
    in_18: in std_logic; 
    in_19: in std_logic; 
    in_20: in std_logic; 
    in_21: in std_logic; 
    in_22: in std_logic; 
    in_23: in std_logic; 
    in_24_nr: in std_logic; 
    in_25_nr: in std_logic; 
    in_26_nr: in std_logic; 
    in_27_nr: in std_logic; 
    in_28_nr: in std_logic; 
    in_29_nr: in std_logic; 
    in_30_nr: in std_logic; 
    in_lsb: in std_logic; 
    in_msb_nr: in std_logic; 
    rst: in std_logic; 
    registered_out: out std_logic_vector(31 downto 0)
  );
end clip_detect_entity_02e572e7fb;

architecture structural of clip_detect_entity_02e572e7fb is
  signal ce_1_sg_x34: std_logic;
  signal clk_1_sg_x34: std_logic;
  signal concat1_y_net_x0: std_logic_vector(31 downto 0);
  signal constant10_op_net_x0: std_logic;
  signal constant12_op_net_x0: std_logic;
  signal constant13_op_net_x0: std_logic;
  signal constant14_op_net_x0: std_logic;
  signal constant15_op_net_x0: std_logic;
  signal constant16_op_net_x0: std_logic;
  signal constant17_op_net_x0: std_logic;
  signal constant18_op_net_x0: std_logic;
  signal constant19_op_net_x0: std_logic;
  signal constant20_op_net_x0: std_logic;
  signal constant21_op_net_x0: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal constant4_op_net_x0: std_logic;
  signal constant5_op_net_x0: std_logic;
  signal constant6_op_net_x0: std_logic;
  signal constant7_op_net_x0: std_logic;
  signal constant8_op_net_x0: std_logic;
  signal convert10_dout_net: std_logic;
  signal convert11_dout_net: std_logic;
  signal convert12_dout_net: std_logic;
  signal convert13_dout_net: std_logic;
  signal convert14_dout_net: std_logic;
  signal convert15_dout_net: std_logic;
  signal convert16_dout_net: std_logic;
  signal convert17_dout_net: std_logic;
  signal convert18_dout_net: std_logic;
  signal convert19_dout_net: std_logic;
  signal convert1_dout_net: std_logic;
  signal convert20_dout_net: std_logic;
  signal convert21_dout_net: std_logic;
  signal convert22_dout_net: std_logic;
  signal convert23_dout_net: std_logic;
  signal convert24_dout_net: std_logic;
  signal convert25_dout_net: std_logic;
  signal convert26_dout_net: std_logic;
  signal convert27_dout_net: std_logic;
  signal convert28_dout_net: std_logic;
  signal convert29_dout_net: std_logic;
  signal convert2_dout_net: std_logic;
  signal convert30_dout_net: std_logic;
  signal convert31_dout_net: std_logic;
  signal convert3_dout_net: std_logic;
  signal convert4_dout_net: std_logic;
  signal convert5_dout_net: std_logic;
  signal convert6_dout_net: std_logic;
  signal convert7_dout_net: std_logic;
  signal convert8_dout_net: std_logic;
  signal convert9_dout_net: std_logic;
  signal convert_dout_net: std_logic;
  signal delay12_q_net_x0: std_logic;
  signal delay13_q_net_x0: std_logic;
  signal delay14_q_net: std_logic;
  signal delay16_q_net_x0: std_logic;
  signal delay1_q_net: std_logic;
  signal delay1_q_net_x2: std_logic;
  signal delay2_q_net_x0: std_logic;
  signal delay2_q_net_x2: std_logic;
  signal delay2_q_net_x3: std_logic;
  signal delay3_q_net: std_logic;
  signal delay4_q_net: std_logic;
  signal delay5_q_net_x0: std_logic;
  signal delay5_q_net_x5: std_logic;
  signal delay5_q_net_x6: std_logic;
  signal delay5_q_net_x7: std_logic;
  signal delay5_q_net_x8: std_logic;
  signal delay5_q_net_x9: std_logic;
  signal delay6_q_net: std_logic;
  signal delay7_q_net: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal of_or_y_net_x3: std_logic;
  signal of_or_y_net_x4: std_logic;
  signal of_or_y_net_x5: std_logic;
  signal of_or_y_net_x6: std_logic;
  signal register10_q_net: std_logic;
  signal register11_q_net: std_logic;
  signal register12_q_net: std_logic;
  signal register13_q_net: std_logic;
  signal register14_q_net: std_logic;
  signal register15_q_net: std_logic;
  signal register16_q_net: std_logic;
  signal register17_q_net: std_logic;
  signal register18_q_net: std_logic;
  signal register19_q_net: std_logic;
  signal register20_q_net: std_logic;
  signal register21_q_net: std_logic;
  signal register22_q_net: std_logic;
  signal register23_q_net: std_logic;
  signal register24_q_net: std_logic;
  signal register25_q_net: std_logic;
  signal register26_q_net: std_logic;
  signal register27_q_net: std_logic;
  signal register28_q_net: std_logic;
  signal register29_q_net: std_logic;
  signal register30_q_net: std_logic;
  signal register31_q_net: std_logic;
  signal register32_q_net: std_logic;
  signal register9_q_net: std_logic;

begin
  ce_1_sg_x34 <= ce_1;
  clk_1_sg_x34 <= clk_1;
  delay8_q_net_x0 <= in_01;
  delay12_q_net_x0 <= in_02;
  delay13_q_net_x0 <= in_03;
  constant16_op_net_x0 <= in_04;
  constant13_op_net_x0 <= in_05;
  constant18_op_net_x0 <= in_06;
  constant17_op_net_x0 <= in_07;
  of_or_y_net_x3 <= in_08;
  of_or_y_net_x4 <= in_09;
  of_or_y_net_x5 <= in_10;
  of_or_y_net_x6 <= in_11;
  constant12_op_net_x0 <= in_12;
  constant10_op_net_x0 <= in_13;
  constant8_op_net_x0 <= in_14;
  constant7_op_net_x0 <= in_15;
  delay5_q_net_x6 <= in_16;
  delay5_q_net_x7 <= in_17;
  delay5_q_net_x8 <= in_18;
  delay5_q_net_x9 <= in_19;
  constant6_op_net_x0 <= in_20;
  constant5_op_net_x0 <= in_21;
  constant4_op_net_x0 <= in_22;
  constant15_op_net_x0 <= in_23;
  constant21_op_net_x0 <= in_24_nr;
  constant20_op_net_x0 <= in_25_nr;
  constant3_op_net_x0 <= in_26_nr;
  constant19_op_net_x0 <= in_27_nr;
  constant14_op_net_x0 <= in_28_nr;
  delay5_q_net_x5 <= in_29_nr;
  delay2_q_net_x3 <= in_30_nr;
  delay2_q_net_x2 <= in_lsb;
  delay1_q_net_x2 <= in_msb_nr;
  delay16_q_net_x0 <= rst;
  registered_out <= concat1_y_net_x0;

  concat1: entity work.concat_9ac2145b44
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => convert_dout_net,
      in1(0) => convert1_dout_net,
      in10(0) => convert10_dout_net,
      in11(0) => convert11_dout_net,
      in12(0) => convert14_dout_net,
      in13(0) => convert15_dout_net,
      in14(0) => convert16_dout_net,
      in15(0) => convert17_dout_net,
      in16(0) => convert12_dout_net,
      in17(0) => convert13_dout_net,
      in18(0) => convert20_dout_net,
      in19(0) => convert21_dout_net,
      in2(0) => convert2_dout_net,
      in20(0) => convert22_dout_net,
      in21(0) => convert23_dout_net,
      in22(0) => convert18_dout_net,
      in23(0) => convert19_dout_net,
      in24(0) => convert24_dout_net,
      in25(0) => convert27_dout_net,
      in26(0) => convert25_dout_net,
      in27(0) => convert26_dout_net,
      in28(0) => convert28_dout_net,
      in29(0) => convert31_dout_net,
      in3(0) => convert3_dout_net,
      in30(0) => convert29_dout_net,
      in31(0) => convert30_dout_net,
      in4(0) => convert4_dout_net,
      in5(0) => convert5_dout_net,
      in6(0) => convert6_dout_net,
      in7(0) => convert7_dout_net,
      in8(0) => convert8_dout_net,
      in9(0) => convert9_dout_net,
      y => concat1_y_net_x0
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay14_q_net,
      dout(0) => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay1_q_net,
      dout(0) => convert1_dout_net
    );

  convert10: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register11_q_net,
      dout(0) => convert10_dout_net
    );

  convert11: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register12_q_net,
      dout(0) => convert11_dout_net
    );

  convert12: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register15_q_net,
      dout(0) => convert12_dout_net
    );

  convert13: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register16_q_net,
      dout(0) => convert13_dout_net
    );

  convert14: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register13_q_net,
      dout(0) => convert14_dout_net
    );

  convert15: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register14_q_net,
      dout(0) => convert15_dout_net
    );

  convert16: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register20_q_net,
      dout(0) => convert16_dout_net
    );

  convert17: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register21_q_net,
      dout(0) => convert17_dout_net
    );

  convert18: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register28_q_net,
      dout(0) => convert18_dout_net
    );

  convert19: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register22_q_net,
      dout(0) => convert19_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay2_q_net_x0,
      dout(0) => convert2_dout_net
    );

  convert20: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register17_q_net,
      dout(0) => convert20_dout_net
    );

  convert21: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register18_q_net,
      dout(0) => convert21_dout_net
    );

  convert22: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register19_q_net,
      dout(0) => convert22_dout_net
    );

  convert23: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register27_q_net,
      dout(0) => convert23_dout_net
    );

  convert24: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register23_q_net,
      dout(0) => convert24_dout_net
    );

  convert25: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register25_q_net,
      dout(0) => convert25_dout_net
    );

  convert26: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register26_q_net,
      dout(0) => convert26_dout_net
    );

  convert27: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register24_q_net,
      dout(0) => convert27_dout_net
    );

  convert28: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register29_q_net,
      dout(0) => convert28_dout_net
    );

  convert29: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register31_q_net,
      dout(0) => convert29_dout_net
    );

  convert3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay3_q_net,
      dout(0) => convert3_dout_net
    );

  convert30: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register32_q_net,
      dout(0) => convert30_dout_net
    );

  convert31: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register30_q_net,
      dout(0) => convert31_dout_net
    );

  convert4: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay4_q_net,
      dout(0) => convert4_dout_net
    );

  convert5: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay5_q_net_x0,
      dout(0) => convert5_dout_net
    );

  convert6: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay6_q_net,
      dout(0) => convert6_dout_net
    );

  convert7: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => delay7_q_net,
      dout(0) => convert7_dout_net
    );

  convert8: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register9_q_net,
      dout(0) => convert8_dout_net
    );

  convert9: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register10_q_net,
      dout(0) => convert9_dout_net
    );

  delay1: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => delay2_q_net_x3,
      q(0) => delay1_q_net
    );

  delay14: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => delay1_q_net_x2,
      q(0) => delay14_q_net
    );

  delay2: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => delay5_q_net_x5,
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => constant14_op_net_x0,
      q(0) => delay3_q_net
    );

  delay4: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => constant19_op_net_x0,
      q(0) => delay4_q_net
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => constant3_op_net_x0,
      q(0) => delay5_q_net_x0
    );

  delay6: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => constant20_op_net_x0,
      q(0) => delay6_q_net
    );

  delay7: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      d(0) => constant21_op_net_x0,
      q(0) => delay7_q_net
    );

  register10: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant4_op_net_x0,
      en(0) => constant4_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register10_q_net
    );

  register11: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant5_op_net_x0,
      en(0) => constant5_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register11_q_net
    );

  register12: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant6_op_net_x0,
      en(0) => constant6_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register12_q_net
    );

  register13: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay5_q_net_x9,
      en(0) => delay5_q_net_x9,
      rst(0) => delay16_q_net_x0,
      q(0) => register13_q_net
    );

  register14: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay5_q_net_x8,
      en(0) => delay5_q_net_x8,
      rst(0) => delay16_q_net_x0,
      q(0) => register14_q_net
    );

  register15: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant7_op_net_x0,
      en(0) => constant7_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register15_q_net
    );

  register16: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant8_op_net_x0,
      en(0) => constant8_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register16_q_net
    );

  register17: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant10_op_net_x0,
      en(0) => constant10_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register17_q_net
    );

  register18: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant12_op_net_x0,
      en(0) => constant12_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register18_q_net
    );

  register19: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => of_or_y_net_x6,
      en(0) => of_or_y_net_x6,
      rst(0) => delay16_q_net_x0,
      q(0) => register19_q_net
    );

  register20: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay5_q_net_x7,
      en(0) => delay5_q_net_x7,
      rst(0) => delay16_q_net_x0,
      q(0) => register20_q_net
    );

  register21: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay5_q_net_x6,
      en(0) => delay5_q_net_x6,
      rst(0) => delay16_q_net_x0,
      q(0) => register21_q_net
    );

  register22: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => of_or_y_net_x3,
      en(0) => of_or_y_net_x3,
      rst(0) => delay16_q_net_x0,
      q(0) => register22_q_net
    );

  register23: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant17_op_net_x0,
      en(0) => constant17_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register23_q_net
    );

  register24: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant18_op_net_x0,
      en(0) => constant18_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register24_q_net
    );

  register25: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant13_op_net_x0,
      en(0) => constant13_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register25_q_net
    );

  register26: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant16_op_net_x0,
      en(0) => constant16_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register26_q_net
    );

  register27: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => of_or_y_net_x5,
      en(0) => of_or_y_net_x5,
      rst(0) => delay16_q_net_x0,
      q(0) => register27_q_net
    );

  register28: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => of_or_y_net_x4,
      en(0) => of_or_y_net_x4,
      rst(0) => delay16_q_net_x0,
      q(0) => register28_q_net
    );

  register29: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay13_q_net_x0,
      en(0) => delay13_q_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register29_q_net
    );

  register30: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay12_q_net_x0,
      en(0) => delay12_q_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register30_q_net
    );

  register31: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay8_q_net_x0,
      en(0) => delay8_q_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register31_q_net
    );

  register32: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => delay2_q_net_x2,
      en(0) => delay2_q_net_x2,
      rst(0) => delay16_q_net_x0,
      q(0) => register32_q_net
    );

  register9: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d(0) => constant15_op_net_x0,
      en(0) => constant15_op_net_x0,
      rst(0) => delay16_q_net_x0,
      q(0) => register9_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/decat0"

entity decat0_entity_c0c8c43019 is
  port (
    in1: in std_logic_vector(31 downto 0); 
    out1: out std_logic_vector(7 downto 0); 
    out2: out std_logic_vector(7 downto 0); 
    out3: out std_logic_vector(7 downto 0); 
    out4: out std_logic_vector(7 downto 0)
  );
end decat0_entity_c0c8c43019;

architecture structural of decat0_entity_c0c8c43019 is
  signal delay_q_net_x1: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net_x1: std_logic_vector(7 downto 0);
  signal slice15_y_net: std_logic_vector(7 downto 0);
  signal slice16_y_net: std_logic_vector(7 downto 0);
  signal slice17_y_net: std_logic_vector(7 downto 0);
  signal slice9_y_net: std_logic_vector(7 downto 0);

begin
  delay_q_net_x1 <= in1;
  out1 <= reinterpret2_output_port_net_x1;
  out2 <= reinterpret1_output_port_net_x1;
  out3 <= reinterpret3_output_port_net_x1;
  out4 <= reinterpret4_output_port_net_x1;

  reinterpret1: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice16_y_net,
      output_port => reinterpret1_output_port_net_x1
    );

  reinterpret2: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice17_y_net,
      output_port => reinterpret2_output_port_net_x1
    );

  reinterpret3: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice15_y_net,
      output_port => reinterpret3_output_port_net_x1
    );

  reinterpret4: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice9_y_net,
      output_port => reinterpret4_output_port_net_x1
    );

  slice15: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x1,
      y => slice15_y_net
    );

  slice16: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 23,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x1,
      y => slice16_y_net
    );

  slice17: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 31,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x1,
      y => slice17_y_net
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay_q_net_x1,
      y => slice9_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/c_to_ri"

entity c_to_ri_entity_131119ad0d is
  port (
    c: in std_logic_vector(7 downto 0); 
    im: out std_logic_vector(3 downto 0); 
    re: out std_logic_vector(3 downto 0)
  );
end c_to_ri_entity_131119ad0d;

architecture structural of c_to_ri_entity_131119ad0d is
  signal force_im_output_port_net_x0: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(3 downto 0);
  signal slice12_y_net_x0: std_logic_vector(7 downto 0);
  signal slice_im_y_net: std_logic_vector(3 downto 0);
  signal slice_re_y_net: std_logic_vector(3 downto 0);

begin
  slice12_y_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_520edef059
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_520edef059
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 3,
      x_width => 8,
      y_width => 4
    )
    port map (
      x => slice12_y_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 7,
      x_width => 8,
      y_width => 4
    )
    port map (
      x => slice12_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/cmult_4bit_br*"

entity cmult_4bit_br_entity_4a8b29578f is
  port (
    a: in std_logic_vector(3 downto 0); 
    b: in std_logic_vector(3 downto 0); 
    c: in std_logic_vector(3 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(3 downto 0); 
    real_x0: out std_logic_vector(8 downto 0)
  );
end cmult_4bit_br_entity_4a8b29578f;

architecture structural of cmult_4bit_br_entity_4a8b29578f is
  signal ce_1_sg_x35: std_logic;
  signal clk_1_sg_x35: std_logic;
  signal concat1_y_net: std_logic_vector(7 downto 0);
  signal concat_y_net: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(3 downto 0);
  signal real_sum_s_net_x0: std_logic_vector(8 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(3 downto 0);
  signal rom1_data_net: std_logic_vector(7 downto 0);
  signal rom_data_net: std_logic_vector(7 downto 0);

begin
  force_re_output_port_net_x2 <= a;
  force_im_output_port_net_x2 <= b;
  force_re_output_port_net_x3 <= c;
  ce_1_sg_x35 <= ce_1;
  clk_1_sg_x35 <= clk_1;
  force_im_output_port_net_x3 <= d;
  real_x0 <= real_sum_s_net_x0;

  concat: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret3_output_port_net,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net
    );

  concat1: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret4_output_port_net,
      y => concat1_y_net
    );

  real_sum: entity work.addsub_fa02ab6440
    port map (
      a => rom_data_net,
      b => rom1_data_net,
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      clr => '0',
      s => real_sum_s_net_x0
    );

  reinterpret1: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_re_output_port_net_x3,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x2,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_re_output_port_net_x2,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x3,
      output_port => reinterpret4_output_port_net
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 8,
      core_name0 => "bmg_33_91da2aa60c18a337",
      latency => 2
    )
    port map (
      addr => concat_y_net,
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      en => "1",
      rst => "0",
      data => rom_data_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 8,
      core_name0 => "bmg_33_91da2aa60c18a337",
      latency => 2
    )
    port map (
      addr => concat1_y_net,
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/real/calc_add"

entity calc_add_entity_ac14aaee05 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(8 downto 0); 
    out_x0: out std_logic_vector(9 downto 0)
  );
end calc_add_entity_ac14aaee05;

architecture structural of calc_add_entity_ac14aaee05 is
  signal add_sub_s_net: std_logic;
  signal ce_1_sg_x36: std_logic;
  signal clk_1_sg_x36: std_logic;
  signal concat_y_net: std_logic_vector(9 downto 0);
  signal const_op_net: std_logic;
  signal convert_addr_dout_net: std_logic_vector(9 downto 0);
  signal counter_op_net_x0: std_logic_vector(8 downto 0);
  signal lsw_y_net: std_logic;
  signal manipulate_op_net: std_logic;
  signal msw_y_net: std_logic_vector(8 downto 0);
  signal mux_y_net_x0: std_logic_vector(9 downto 0);

begin
  ce_1_sg_x36 <= ce_1;
  clk_1_sg_x36 <= clk_1;
  counter_op_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  add_sub: entity work.addsub_c13097e33e
    port map (
      a(0) => const_op_net,
      b(0) => lsw_y_net,
      ce => ce_1_sg_x36,
      clk => clk_1_sg_x36,
      clr => '0',
      s(0) => add_sub_s_net
    );

  concat: entity work.concat_1d98d96b58
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => msw_y_net,
      in1(0) => add_sub_s_net,
      y => concat_y_net
    );

  const: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => const_op_net
    );

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 9,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => counter_op_net_x0,
      dout => convert_addr_dout_net
    );

  lsw: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 10,
      y_width => 1
    )
    port map (
      x => convert_addr_dout_net,
      y(0) => lsw_y_net
    );

  manipulate: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => manipulate_op_net
    );

  msw: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 9,
      x_width => 10,
      y_width => 9
    )
    port map (
      x => convert_addr_dout_net,
      y => msw_y_net
    );

  mux: entity work.mux_4fe5face7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert_addr_dout_net,
      d1 => concat_y_net,
      sel(0) => manipulate_op_net,
      y => mux_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/real"

entity real_entity_34e1663dab is
  port (
    addr: in std_logic_vector(8 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(31 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(9 downto 0); 
    convert_din1_x0: out std_logic_vector(31 downto 0); 
    convert_we_x0: out std_logic
  );
end real_entity_34e1663dab;

architecture structural of real_entity_34e1663dab is
  signal ce_1_sg_x37: std_logic;
  signal clk_1_sg_x37: std_logic;
  signal convert_addr_dout_net_x0: std_logic_vector(9 downto 0);
  signal convert_din1_dout_net_x0: std_logic_vector(31 downto 0);
  signal convert_din_dout_net: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal counter_op_net_x1: std_logic_vector(8 downto 0);
  signal mux_y_net_x0: std_logic_vector(9 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal relational5_op_net_x0: std_logic;

begin
  counter_op_net_x1 <= addr;
  ce_1_sg_x37 <= ce_1;
  clk_1_sg_x37 <= clk_1;
  reinterpret_output_port_net_x0 <= data_in;
  relational5_op_net_x0 <= we;
  convert_addr_x0 <= convert_addr_dout_net_x0;
  convert_din1_x0 <= convert_din1_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;

  calc_add_ac14aaee05: entity work.calc_add_entity_ac14aaee05
    port map (
      ce_1 => ce_1_sg_x37,
      clk_1 => clk_1_sg_x37,
      in_x0 => counter_op_net_x1,
      out_x0 => mux_y_net_x0
    );

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mux_y_net_x0,
      dout => convert_addr_dout_net_x0
    );

  convert_din: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => reinterpret_output_port_net_x0,
      dout => convert_din_dout_net
    );

  convert_din1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => convert_din_dout_net,
      dout => convert_din1_dout_net_x0
    );

  convert_we: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => relational5_op_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/vacc_32bit/delay_bram"

entity delay_bram_entity_71ab54dc78 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(31 downto 0); 
    out1: out std_logic_vector(31 downto 0)
  );
end delay_bram_entity_71ab54dc78;

architecture structural of delay_bram_entity_71ab54dc78 is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x38: std_logic;
  signal clk_1_sg_x38: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x38 <= ce_1;
  clk_1_sg_x38 <= clk_1;
  adder0_s_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x0;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 507,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_717486a23436c11d",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x38,
      clk => clk_1_sg_x38,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 9,
      c_width => 32,
      core_name0 => "bmg_33_b69a6630af1fcef6",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x38,
      clk => clk_1_sg_x38,
      data_in => adder0_s_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/vacc_32bit/pulse_ext"

entity pulse_ext_entity_5c98934cb0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext_entity_5c98934cb0;

architecture structural of pulse_ext_entity_5c98934cb0 is
  signal ce_1_sg_x40: std_logic;
  signal clk_1_sg_x40: std_logic;
  signal constant5_op_net: std_logic_vector(9 downto 0);
  signal counter3_op_net: std_logic_vector(9 downto 0);
  signal delay3_q_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x1: std_logic;

begin
  ce_1_sg_x40 <= ce_1;
  clk_1_sg_x40 <= clk_1;
  delay3_q_net_x1 <= in_x0;
  out_x0 <= relational5_op_net_x1;

  constant5: entity work.constant_fbc2f0cce1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_acf8df2a66449f86",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      clr => '0',
      en(0) => relational5_op_net_x1,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_5a45517e62: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x40,
      clk_1 => clk_1_sg_x40,
      in_x0 => delay3_q_net_x1,
      out_x0 => logical_y_net_x0
    );

  relational5: entity work.relational_f6702ea2f7
    port map (
      a => counter3_op_net,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa/vacc_32bit"

entity vacc_32bit_entity_a2d6b76fb1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(8 downto 0); 
    new_acc: in std_logic; 
    dout: out std_logic_vector(31 downto 0); 
    valid: out std_logic
  );
end vacc_32bit_entity_a2d6b76fb1;

architecture structural of vacc_32bit_entity_a2d6b76fb1 is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x41: std_logic;
  signal clk_1_sg_x41: std_logic;
  signal delay3_q_net_x2: std_logic;
  signal mux0_y_net: std_logic_vector(31 downto 0);
  signal real_sum_s_net_x1: std_logic_vector(8 downto 0);
  signal relational5_op_net_x2: std_logic;
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal zero_op_net: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x41 <= ce_1;
  clk_1_sg_x41 <= clk_1;
  real_sum_s_net_x1 <= din;
  delay3_q_net_x2 <= new_acc;
  dout <= single_port_ram_data_out_net_x1;
  valid <= relational5_op_net_x2;

  adder0: entity work.addsub_69d47b8dbc
    port map (
      a => real_sum_s_net_x1,
      b => mux0_y_net,
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      s => adder0_s_net_x0
    );

  delay_bram_71ab54dc78: entity work.delay_bram_entity_71ab54dc78
    port map (
      ce_1 => ce_1_sg_x41,
      clk_1 => clk_1_sg_x41,
      in1 => adder0_s_net_x0,
      out1 => single_port_ram_data_out_net_x1
    );

  mux0: entity work.mux_286b77e019
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => single_port_ram_data_out_net_x1,
      d1 => zero_op_net,
      sel(0) => relational5_op_net_x2,
      y => mux0_y_net
    );

  pulse_ext_5c98934cb0: entity work.pulse_ext_entity_5c98934cb0
    port map (
      ce_1 => ce_1_sg_x41,
      clk_1 => clk_1_sg_x41,
      in_x0 => delay3_q_net_x2,
      out_x0 => relational5_op_net_x2
    );

  zero: entity work.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => zero_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/aa"

entity aa_entity_6955e73be4 is
  port (
    a_bi: in std_logic_vector(7 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    new_acc: in std_logic; 
    counter_x0: out std_logic_vector(8 downto 0); 
    delay3_x0: out std_logic; 
    real_x0: out std_logic_vector(9 downto 0); 
    real_x1: out std_logic_vector(31 downto 0); 
    real_x2: out std_logic; 
    reinterpret_x0: out std_logic_vector(31 downto 0); 
    vacc_32bit: out std_logic
  );
end aa_entity_6955e73be4;

architecture structural of aa_entity_6955e73be4 is
  signal ce_1_sg_x42: std_logic;
  signal clk_1_sg_x42: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(9 downto 0);
  signal convert_din1_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal counter_op_net_x2: std_logic_vector(8 downto 0);
  signal delay3_q_net_x3: std_logic;
  signal delay6_q_net_x0: std_logic;
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(3 downto 0);
  signal real_sum_s_net_x1: std_logic_vector(8 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(31 downto 0);
  signal relational5_op_net_x3: std_logic;
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal slice12_y_net_x2: std_logic_vector(7 downto 0);

begin
  slice12_y_net_x2 <= a_bi;
  ce_1_sg_x42 <= ce_1;
  clk_1_sg_x42 <= clk_1;
  delay6_q_net_x0 <= new_acc;
  counter_x0 <= counter_op_net_x2;
  delay3_x0 <= delay3_q_net_x3;
  real_x0 <= convert_addr_dout_net_x1;
  real_x1 <= convert_din1_dout_net_x1;
  real_x2 <= convert_we_dout_net_x1;
  reinterpret_x0 <= reinterpret_output_port_net_x1;
  vacc_32bit <= relational5_op_net_x3;

  c_to_ri1_c117b73865: entity work.c_to_ri_entity_131119ad0d
    port map (
      c => slice12_y_net_x2,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri_131119ad0d: entity work.c_to_ri_entity_131119ad0d
    port map (
      c => slice12_y_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  cmult_4bit_br_4a8b29578f: entity work.cmult_4bit_br_entity_4a8b29578f
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x42,
      clk_1 => clk_1_sg_x42,
      d => force_im_output_port_net_x3,
      real_x0 => real_sum_s_net_x1
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      clr => '0',
      en(0) => relational5_op_net_x3,
      rst(0) => delay3_q_net_x3,
      op => counter_op_net_x2
    );

  delay3: entity work.xldelay
    generic map (
      latency => 5,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      d(0) => delay6_q_net_x0,
      en => '1',
      q(0) => delay3_q_net_x3
    );

  real_34e1663dab: entity work.real_entity_34e1663dab
    port map (
      addr => counter_op_net_x2,
      ce_1 => ce_1_sg_x42,
      clk_1 => clk_1_sg_x42,
      data_in => reinterpret_output_port_net_x1,
      we => relational5_op_net_x3,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din1_x0 => convert_din1_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x1,
      output_port => reinterpret_output_port_net_x1
    );

  vacc_32bit_a2d6b76fb1: entity work.vacc_32bit_entity_a2d6b76fb1
    port map (
      ce_1 => ce_1_sg_x42,
      clk_1 => clk_1_sg_x42,
      din => real_sum_s_net_x1,
      new_acc => delay3_q_net_x3,
      dout => single_port_ram_data_out_net_x1,
      valid => relational5_op_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/ab/cmult_4bit_br*"

entity cmult_4bit_br_entity_e034145201 is
  port (
    a: in std_logic_vector(3 downto 0); 
    b: in std_logic_vector(3 downto 0); 
    c: in std_logic_vector(3 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(3 downto 0); 
    imag: out std_logic_vector(8 downto 0); 
    real_x0: out std_logic_vector(8 downto 0)
  );
end cmult_4bit_br_entity_e034145201;

architecture structural of cmult_4bit_br_entity_e034145201 is
  signal ce_1_sg_x67: std_logic;
  signal clk_1_sg_x67: std_logic;
  signal concat1_y_net: std_logic_vector(7 downto 0);
  signal concat2_y_net: std_logic_vector(7 downto 0);
  signal concat3_y_net: std_logic_vector(7 downto 0);
  signal concat_y_net: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(3 downto 0);
  signal imag_sum_s_net_x0: std_logic_vector(8 downto 0);
  signal real_sum_s_net_x0: std_logic_vector(8 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret8_output_port_net: std_logic_vector(3 downto 0);
  signal rom1_data_net: std_logic_vector(7 downto 0);
  signal rom2_data_net: std_logic_vector(7 downto 0);
  signal rom3_data_net: std_logic_vector(7 downto 0);
  signal rom_data_net: std_logic_vector(7 downto 0);

begin
  force_re_output_port_net_x2 <= a;
  force_im_output_port_net_x2 <= b;
  force_re_output_port_net_x3 <= c;
  ce_1_sg_x67 <= ce_1;
  clk_1_sg_x67 <= clk_1;
  force_im_output_port_net_x3 <= d;
  imag <= imag_sum_s_net_x0;
  real_x0 <= real_sum_s_net_x0;

  concat: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret3_output_port_net,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net
    );

  concat1: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret4_output_port_net,
      y => concat1_y_net
    );

  concat2: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret5_output_port_net,
      in1 => reinterpret6_output_port_net,
      y => concat2_y_net
    );

  concat3: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret7_output_port_net,
      in1 => reinterpret8_output_port_net,
      y => concat3_y_net
    );

  imag_sum: entity work.addsub_7c012b0e13
    port map (
      a => rom2_data_net,
      b => rom3_data_net,
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      clr => '0',
      s => imag_sum_s_net_x0
    );

  real_sum: entity work.addsub_fa02ab6440
    port map (
      a => rom_data_net,
      b => rom1_data_net,
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      clr => '0',
      s => real_sum_s_net_x0
    );

  reinterpret1: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_re_output_port_net_x3,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x2,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_re_output_port_net_x2,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x3,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x2,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_re_output_port_net_x3,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_re_output_port_net_x2,
      output_port => reinterpret7_output_port_net
    );

  reinterpret8: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x3,
      output_port => reinterpret8_output_port_net
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 8,
      core_name0 => "bmg_33_91da2aa60c18a337",
      latency => 2
    )
    port map (
      addr => concat_y_net,
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      en => "1",
      rst => "0",
      data => rom_data_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 8,
      core_name0 => "bmg_33_91da2aa60c18a337",
      latency => 2
    )
    port map (
      addr => concat1_y_net,
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 8,
      core_name0 => "bmg_33_91da2aa60c18a337",
      latency => 2
    )
    port map (
      addr => concat2_y_net,
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 8,
      core_name0 => "bmg_33_91da2aa60c18a337",
      latency => 2
    )
    port map (
      addr => concat3_y_net,
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0/ab"

entity ab_entity_36103a615c is
  port (
    a_bi: in std_logic_vector(7 downto 0); 
    c_di: in std_logic_vector(7 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    new_acc: in std_logic; 
    imag: out std_logic_vector(9 downto 0); 
    imag_x0: out std_logic_vector(31 downto 0); 
    imag_x1: out std_logic; 
    real_x0: out std_logic_vector(9 downto 0); 
    real_x1: out std_logic_vector(31 downto 0); 
    real_x2: out std_logic
  );
end ab_entity_36103a615c;

architecture structural of ab_entity_36103a615c is
  signal ce_1_sg_x80: std_logic;
  signal clk_1_sg_x80: std_logic;
  signal convert_addr_dout_net_x2: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x3: std_logic_vector(9 downto 0);
  signal convert_din1_dout_net_x2: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x3: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x2: std_logic;
  signal convert_we_dout_net_x3: std_logic;
  signal counter_op_net_x3: std_logic_vector(8 downto 0);
  signal delay3_q_net_x5: std_logic;
  signal delay6_q_net_x4: std_logic;
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(3 downto 0);
  signal imag_sum_s_net_x1: std_logic_vector(8 downto 0);
  signal real_sum_s_net_x1: std_logic_vector(8 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal relational5_op_net_x2: std_logic;
  signal relational5_op_net_x3: std_logic;
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(31 downto 0);
  signal slice12_y_net_x4: std_logic_vector(7 downto 0);
  signal slice13_y_net_x4: std_logic_vector(7 downto 0);

begin
  slice12_y_net_x4 <= a_bi;
  slice13_y_net_x4 <= c_di;
  ce_1_sg_x80 <= ce_1;
  clk_1_sg_x80 <= clk_1;
  delay6_q_net_x4 <= new_acc;
  imag <= convert_addr_dout_net_x2;
  imag_x0 <= convert_din1_dout_net_x2;
  imag_x1 <= convert_we_dout_net_x2;
  real_x0 <= convert_addr_dout_net_x3;
  real_x1 <= convert_din1_dout_net_x3;
  real_x2 <= convert_we_dout_net_x3;

  c_to_ri1_ffddc7a865: entity work.c_to_ri_entity_131119ad0d
    port map (
      c => slice13_y_net_x4,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri_c2dde6ad16: entity work.c_to_ri_entity_131119ad0d
    port map (
      c => slice12_y_net_x4,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  cmult_4bit_br_e034145201: entity work.cmult_4bit_br_entity_e034145201
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      d => force_im_output_port_net_x3,
      imag => imag_sum_s_net_x1,
      real_x0 => real_sum_s_net_x1
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      en(0) => relational5_op_net_x2,
      rst(0) => delay3_q_net_x5,
      op => counter_op_net_x3
    );

  delay3: entity work.xldelay
    generic map (
      latency => 5,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      d(0) => delay6_q_net_x4,
      en => '1',
      q(0) => delay3_q_net_x5
    );

  imag_b9a5eb6b71: entity work.real_entity_34e1663dab
    port map (
      addr => counter_op_net_x3,
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      data_in => reinterpret1_output_port_net_x0,
      we => relational5_op_net_x3,
      convert_addr_x0 => convert_addr_dout_net_x2,
      convert_din1_x0 => convert_din1_dout_net_x2,
      convert_we_x0 => convert_we_dout_net_x2
    );

  real_e5e5e1b7b4: entity work.real_entity_34e1663dab
    port map (
      addr => counter_op_net_x3,
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      data_in => reinterpret_output_port_net_x0,
      we => relational5_op_net_x2,
      convert_addr_x0 => convert_addr_dout_net_x3,
      convert_din1_x0 => convert_din1_dout_net_x3,
      convert_we_x0 => convert_we_dout_net_x3
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x1,
      output_port => reinterpret_output_port_net_x0
    );

  reinterpret1: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x2,
      output_port => reinterpret1_output_port_net_x0
    );

  vacc_32bit1_21344359fc: entity work.vacc_32bit_entity_a2d6b76fb1
    port map (
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      din => imag_sum_s_net_x1,
      new_acc => delay3_q_net_x5,
      dout => single_port_ram_data_out_net_x2,
      valid => relational5_op_net_x3
    );

  vacc_32bit_8c897f0983: entity work.vacc_32bit_entity_a2d6b76fb1
    port map (
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      din => real_sum_s_net_x1,
      new_acc => delay3_q_net_x5,
      dout => single_port_ram_data_out_net_x1,
      valid => relational5_op_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/dir_x0"

entity dir_x0_entity_7ae486fe94 is
  port (
    a: in std_logic_vector(7 downto 0); 
    b: in std_logic_vector(7 downto 0); 
    c: in std_logic_vector(7 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(7 downto 0); 
    new_acc: in std_logic; 
    aa: out std_logic_vector(8 downto 0); 
    aa1: out std_logic_vector(8 downto 0); 
    aa1_x0: out std_logic; 
    aa1_x1: out std_logic_vector(31 downto 0); 
    aa1_x2: out std_logic_vector(9 downto 0); 
    aa1_x3: out std_logic_vector(31 downto 0); 
    aa1_x4: out std_logic; 
    aa1_x5: out std_logic; 
    aa2: out std_logic_vector(8 downto 0); 
    aa2_x0: out std_logic; 
    aa2_x1: out std_logic_vector(31 downto 0); 
    aa2_x2: out std_logic_vector(9 downto 0); 
    aa2_x3: out std_logic_vector(31 downto 0); 
    aa2_x4: out std_logic; 
    aa2_x5: out std_logic; 
    aa3: out std_logic_vector(8 downto 0); 
    aa3_x0: out std_logic; 
    aa3_x1: out std_logic_vector(31 downto 0); 
    aa3_x2: out std_logic_vector(9 downto 0); 
    aa3_x3: out std_logic_vector(31 downto 0); 
    aa3_x4: out std_logic; 
    aa3_x5: out std_logic; 
    aa_x0: out std_logic; 
    aa_x1: out std_logic_vector(31 downto 0); 
    aa_x2: out std_logic_vector(9 downto 0); 
    aa_x3: out std_logic_vector(31 downto 0); 
    aa_x4: out std_logic; 
    aa_x5: out std_logic; 
    ab: out std_logic_vector(9 downto 0); 
    ab_x0: out std_logic_vector(31 downto 0); 
    ab_x1: out std_logic; 
    ab_x2: out std_logic_vector(9 downto 0); 
    ab_x3: out std_logic_vector(31 downto 0); 
    ab_x4: out std_logic; 
    ac: out std_logic_vector(9 downto 0); 
    ac1: out std_logic_vector(9 downto 0); 
    ac1_x0: out std_logic_vector(31 downto 0); 
    ac1_x1: out std_logic; 
    ac1_x2: out std_logic_vector(9 downto 0); 
    ac1_x3: out std_logic_vector(31 downto 0); 
    ac1_x4: out std_logic; 
    ac2: out std_logic_vector(9 downto 0); 
    ac2_x0: out std_logic_vector(31 downto 0); 
    ac2_x1: out std_logic; 
    ac2_x2: out std_logic_vector(9 downto 0); 
    ac2_x3: out std_logic_vector(31 downto 0); 
    ac2_x4: out std_logic; 
    ac3: out std_logic_vector(9 downto 0); 
    ac3_x0: out std_logic_vector(31 downto 0); 
    ac3_x1: out std_logic; 
    ac3_x2: out std_logic_vector(9 downto 0); 
    ac3_x3: out std_logic_vector(31 downto 0); 
    ac3_x4: out std_logic; 
    ac_x0: out std_logic_vector(31 downto 0); 
    ac_x1: out std_logic; 
    ac_x2: out std_logic_vector(9 downto 0); 
    ac_x3: out std_logic_vector(31 downto 0); 
    ac_x4: out std_logic; 
    ad: out std_logic_vector(9 downto 0); 
    ad_x0: out std_logic_vector(31 downto 0); 
    ad_x1: out std_logic; 
    ad_x2: out std_logic_vector(9 downto 0); 
    ad_x3: out std_logic_vector(31 downto 0); 
    ad_x4: out std_logic
  );
end dir_x0_entity_7ae486fe94;

architecture structural of dir_x0_entity_7ae486fe94 is
  signal ce_1_sg_x151: std_logic;
  signal clk_1_sg_x151: std_logic;
  signal convert_addr_dout_net_x17: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x18: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x19: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x20: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x21: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x22: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x23: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x24: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x25: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x26: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x27: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x28: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x29: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x30: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x31: std_logic_vector(9 downto 0);
  signal convert_addr_dout_net_x32: std_logic_vector(9 downto 0);
  signal convert_din1_dout_net_x17: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x18: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x19: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x20: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x21: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x22: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x23: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x24: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x25: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x26: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x27: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x28: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x29: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x30: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x31: std_logic_vector(31 downto 0);
  signal convert_din1_dout_net_x32: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x17: std_logic;
  signal convert_we_dout_net_x18: std_logic;
  signal convert_we_dout_net_x19: std_logic;
  signal convert_we_dout_net_x20: std_logic;
  signal convert_we_dout_net_x21: std_logic;
  signal convert_we_dout_net_x22: std_logic;
  signal convert_we_dout_net_x23: std_logic;
  signal convert_we_dout_net_x24: std_logic;
  signal convert_we_dout_net_x25: std_logic;
  signal convert_we_dout_net_x26: std_logic;
  signal convert_we_dout_net_x27: std_logic;
  signal convert_we_dout_net_x28: std_logic;
  signal convert_we_dout_net_x29: std_logic;
  signal convert_we_dout_net_x30: std_logic;
  signal convert_we_dout_net_x31: std_logic;
  signal convert_we_dout_net_x32: std_logic;
  signal counter_op_net_x6: std_logic_vector(8 downto 0);
  signal counter_op_net_x7: std_logic_vector(8 downto 0);
  signal counter_op_net_x8: std_logic_vector(8 downto 0);
  signal counter_op_net_x9: std_logic_vector(8 downto 0);
  signal delay3_q_net_x10: std_logic;
  signal delay3_q_net_x7: std_logic;
  signal delay3_q_net_x8: std_logic;
  signal delay3_q_net_x9: std_logic;
  signal delay6_q_net_x10: std_logic;
  signal reinterpret_output_port_net_x5: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x6: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x7: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(31 downto 0);
  signal relational5_op_net_x10: std_logic;
  signal relational5_op_net_x7: std_logic;
  signal relational5_op_net_x8: std_logic;
  signal relational5_op_net_x9: std_logic;
  signal slice12_y_net_x9: std_logic_vector(7 downto 0);
  signal slice13_y_net_x9: std_logic_vector(7 downto 0);
  signal slice15_y_net_x9: std_logic_vector(7 downto 0);
  signal slice20_y_net_x9: std_logic_vector(7 downto 0);

begin
  slice12_y_net_x9 <= a;
  slice13_y_net_x9 <= b;
  slice15_y_net_x9 <= c;
  ce_1_sg_x151 <= ce_1;
  clk_1_sg_x151 <= clk_1;
  slice20_y_net_x9 <= d;
  delay6_q_net_x10 <= new_acc;
  aa <= counter_op_net_x6;
  aa1 <= counter_op_net_x7;
  aa1_x0 <= delay3_q_net_x8;
  aa1_x1 <= reinterpret_output_port_net_x6;
  aa1_x2 <= convert_addr_dout_net_x18;
  aa1_x3 <= convert_din1_dout_net_x18;
  aa1_x4 <= convert_we_dout_net_x18;
  aa1_x5 <= relational5_op_net_x8;
  aa2 <= counter_op_net_x8;
  aa2_x0 <= delay3_q_net_x9;
  aa2_x1 <= reinterpret_output_port_net_x7;
  aa2_x2 <= convert_addr_dout_net_x19;
  aa2_x3 <= convert_din1_dout_net_x19;
  aa2_x4 <= convert_we_dout_net_x19;
  aa2_x5 <= relational5_op_net_x9;
  aa3 <= counter_op_net_x9;
  aa3_x0 <= delay3_q_net_x10;
  aa3_x1 <= reinterpret_output_port_net_x8;
  aa3_x2 <= convert_addr_dout_net_x20;
  aa3_x3 <= convert_din1_dout_net_x20;
  aa3_x4 <= convert_we_dout_net_x20;
  aa3_x5 <= relational5_op_net_x10;
  aa_x0 <= delay3_q_net_x7;
  aa_x1 <= reinterpret_output_port_net_x5;
  aa_x2 <= convert_addr_dout_net_x17;
  aa_x3 <= convert_din1_dout_net_x17;
  aa_x4 <= convert_we_dout_net_x17;
  aa_x5 <= relational5_op_net_x7;
  ab <= convert_addr_dout_net_x21;
  ab_x0 <= convert_din1_dout_net_x21;
  ab_x1 <= convert_we_dout_net_x21;
  ab_x2 <= convert_addr_dout_net_x22;
  ab_x3 <= convert_din1_dout_net_x22;
  ab_x4 <= convert_we_dout_net_x22;
  ac <= convert_addr_dout_net_x23;
  ac1 <= convert_addr_dout_net_x25;
  ac1_x0 <= convert_din1_dout_net_x25;
  ac1_x1 <= convert_we_dout_net_x25;
  ac1_x2 <= convert_addr_dout_net_x26;
  ac1_x3 <= convert_din1_dout_net_x26;
  ac1_x4 <= convert_we_dout_net_x26;
  ac2 <= convert_addr_dout_net_x27;
  ac2_x0 <= convert_din1_dout_net_x27;
  ac2_x1 <= convert_we_dout_net_x27;
  ac2_x2 <= convert_addr_dout_net_x28;
  ac2_x3 <= convert_din1_dout_net_x28;
  ac2_x4 <= convert_we_dout_net_x28;
  ac3 <= convert_addr_dout_net_x29;
  ac3_x0 <= convert_din1_dout_net_x29;
  ac3_x1 <= convert_we_dout_net_x29;
  ac3_x2 <= convert_addr_dout_net_x30;
  ac3_x3 <= convert_din1_dout_net_x30;
  ac3_x4 <= convert_we_dout_net_x30;
  ac_x0 <= convert_din1_dout_net_x23;
  ac_x1 <= convert_we_dout_net_x23;
  ac_x2 <= convert_addr_dout_net_x24;
  ac_x3 <= convert_din1_dout_net_x24;
  ac_x4 <= convert_we_dout_net_x24;
  ad <= convert_addr_dout_net_x31;
  ad_x0 <= convert_din1_dout_net_x31;
  ad_x1 <= convert_we_dout_net_x31;
  ad_x2 <= convert_addr_dout_net_x32;
  ad_x3 <= convert_din1_dout_net_x32;
  ad_x4 <= convert_we_dout_net_x32;

  aa1_b86a1b0ba7: entity work.aa_entity_6955e73be4
    port map (
      a_bi => slice13_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      counter_x0 => counter_op_net_x7,
      delay3_x0 => delay3_q_net_x8,
      real_x0 => convert_addr_dout_net_x18,
      real_x1 => convert_din1_dout_net_x18,
      real_x2 => convert_we_dout_net_x18,
      reinterpret_x0 => reinterpret_output_port_net_x6,
      vacc_32bit => relational5_op_net_x8
    );

  aa2_e0d66b193f: entity work.aa_entity_6955e73be4
    port map (
      a_bi => slice15_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      counter_x0 => counter_op_net_x8,
      delay3_x0 => delay3_q_net_x9,
      real_x0 => convert_addr_dout_net_x19,
      real_x1 => convert_din1_dout_net_x19,
      real_x2 => convert_we_dout_net_x19,
      reinterpret_x0 => reinterpret_output_port_net_x7,
      vacc_32bit => relational5_op_net_x9
    );

  aa3_5b50fec744: entity work.aa_entity_6955e73be4
    port map (
      a_bi => slice20_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      counter_x0 => counter_op_net_x9,
      delay3_x0 => delay3_q_net_x10,
      real_x0 => convert_addr_dout_net_x20,
      real_x1 => convert_din1_dout_net_x20,
      real_x2 => convert_we_dout_net_x20,
      reinterpret_x0 => reinterpret_output_port_net_x8,
      vacc_32bit => relational5_op_net_x10
    );

  aa_6955e73be4: entity work.aa_entity_6955e73be4
    port map (
      a_bi => slice12_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      counter_x0 => counter_op_net_x6,
      delay3_x0 => delay3_q_net_x7,
      real_x0 => convert_addr_dout_net_x17,
      real_x1 => convert_din1_dout_net_x17,
      real_x2 => convert_we_dout_net_x17,
      reinterpret_x0 => reinterpret_output_port_net_x5,
      vacc_32bit => relational5_op_net_x7
    );

  ab_36103a615c: entity work.ab_entity_36103a615c
    port map (
      a_bi => slice12_y_net_x9,
      c_di => slice13_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      imag => convert_addr_dout_net_x21,
      imag_x0 => convert_din1_dout_net_x21,
      imag_x1 => convert_we_dout_net_x21,
      real_x0 => convert_addr_dout_net_x22,
      real_x1 => convert_din1_dout_net_x22,
      real_x2 => convert_we_dout_net_x22
    );

  ac1_932bf2cf52: entity work.ab_entity_36103a615c
    port map (
      a_bi => slice13_y_net_x9,
      c_di => slice15_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      imag => convert_addr_dout_net_x25,
      imag_x0 => convert_din1_dout_net_x25,
      imag_x1 => convert_we_dout_net_x25,
      real_x0 => convert_addr_dout_net_x26,
      real_x1 => convert_din1_dout_net_x26,
      real_x2 => convert_we_dout_net_x26
    );

  ac2_93877943e5: entity work.ab_entity_36103a615c
    port map (
      a_bi => slice13_y_net_x9,
      c_di => slice20_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      imag => convert_addr_dout_net_x27,
      imag_x0 => convert_din1_dout_net_x27,
      imag_x1 => convert_we_dout_net_x27,
      real_x0 => convert_addr_dout_net_x28,
      real_x1 => convert_din1_dout_net_x28,
      real_x2 => convert_we_dout_net_x28
    );

  ac3_cfd4110a2d: entity work.ab_entity_36103a615c
    port map (
      a_bi => slice15_y_net_x9,
      c_di => slice20_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      imag => convert_addr_dout_net_x29,
      imag_x0 => convert_din1_dout_net_x29,
      imag_x1 => convert_we_dout_net_x29,
      real_x0 => convert_addr_dout_net_x30,
      real_x1 => convert_din1_dout_net_x30,
      real_x2 => convert_we_dout_net_x30
    );

  ac_42412d06e2: entity work.ab_entity_36103a615c
    port map (
      a_bi => slice12_y_net_x9,
      c_di => slice15_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      imag => convert_addr_dout_net_x23,
      imag_x0 => convert_din1_dout_net_x23,
      imag_x1 => convert_we_dout_net_x23,
      real_x0 => convert_addr_dout_net_x24,
      real_x1 => convert_din1_dout_net_x24,
      real_x2 => convert_we_dout_net_x24
    );

  ad_cb747f70ee: entity work.ab_entity_36103a615c
    port map (
      a_bi => slice12_y_net_x9,
      c_di => slice20_y_net_x9,
      ce_1 => ce_1_sg_x151,
      clk_1 => clk_1_sg_x151,
      new_acc => delay6_q_net_x10,
      imag => convert_addr_dout_net_x31,
      imag_x0 => convert_din1_dout_net_x31,
      imag_x1 => convert_we_dout_net_x31,
      real_x0 => convert_addr_dout_net_x32,
      real_x1 => convert_din1_dout_net_x32,
      real_x2 => convert_we_dout_net_x32
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/delay_srl0"

entity delay_srl0_entity_6771a4f5a8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(35 downto 0); 
    out_x0: out std_logic_vector(35 downto 0)
  );
end delay_srl0_entity_6771a4f5a8;

architecture structural of delay_srl0_entity_6771a4f5a8 is
  signal ce_1_sg_x269: std_logic;
  signal clk_1_sg_x269: std_logic;
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal delay_ff_q_net: std_logic_vector(35 downto 0);
  signal delay_srl_q_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x269 <= ce_1;
  clk_1_sg_x269 <= clk_1;
  concat_y_net_x0 <= in_x0;
  out_x0 <= delay_srl_q_net_x0;

  delay_ff: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x269,
      clk => clk_1_sg_x269,
      d => concat_y_net_x0,
      en => '1',
      q => delay_ff_q_net
    );

  delay_srl: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x269,
      clk => clk_1_sg_x269,
      d => delay_ff_q_net,
      en => '1',
      q => delay_srl_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/hilbert0/c_to_ri"

entity c_to_ri_entity_6df0a21fa1 is
  port (
    c: in std_logic_vector(35 downto 0); 
    im: out std_logic_vector(17 downto 0); 
    re: out std_logic_vector(17 downto 0)
  );
end c_to_ri_entity_6df0a21fa1;

architecture structural of c_to_ri_entity_6df0a21fa1 is
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal mux0_y_net_x0: std_logic_vector(35 downto 0);
  signal slice_im_y_net: std_logic_vector(17 downto 0);
  signal slice_re_y_net: std_logic_vector(17 downto 0);

begin
  mux0_y_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => mux0_y_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => mux0_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/hilbert0/ri_to_c"

entity ri_to_c_entity_f7870abfd7 is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c_entity_f7870abfd7;

architecture structural of ri_to_c_entity_f7870abfd7 is
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net: std_logic_vector(17 downto 0);
  signal force_re_output_port_net: std_logic_vector(17 downto 0);

begin
  convert2_dout_net_x0 <= im;
  convert_dout_net_x0 <= re;
  c <= concat_y_net_x1;

  concat: entity work.concat_b198bd62b0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x1
    );

  force_im: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert2_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/hilbert0"

entity hilbert0_entity_78b8cb99bf is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    even: out std_logic_vector(35 downto 0); 
    odd: out std_logic_vector(35 downto 0)
  );
end hilbert0_entity_78b8cb99bf;

architecture structural of hilbert0_entity_78b8cb99bf is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x271: std_logic;
  signal clk_1_sg_x271: std_logic;
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert3_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal mux0_y_net_x1: std_logic_vector(35 downto 0);
  signal mux1_y_net_x1: std_logic_vector(35 downto 0);
  signal scale1_op_net: std_logic_vector(18 downto 0);
  signal scale2_op_net: std_logic_vector(18 downto 0);
  signal scale3_op_net: std_logic_vector(18 downto 0);
  signal scale_op_net: std_logic_vector(18 downto 0);

begin
  mux0_y_net_x1 <= a;
  mux1_y_net_x1 <= b;
  ce_1_sg_x271 <= ce_1;
  clk_1_sg_x271 <= clk_1;
  even <= concat_y_net_x3;
  odd <= concat_y_net_x4;

  addsub: entity work.addsub_e140b59ec8
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_7461f1deba
    port map (
      a => force_re_output_port_net_x1,
      b => force_re_output_port_net_x0,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_7461f1deba
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_e140b59ec8
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => addsub3_s_net
    );

  c_to_ri1_3c0593d72b: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => mux1_y_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_6df0a21fa1: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => mux0_y_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 18,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      din => scale_op_net,
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 18,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      din => scale1_op_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 18,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      din => scale2_op_net,
      dout => convert2_dout_net_x0
    );

  convert3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 18,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      din => scale3_op_net,
      dout => convert3_dout_net_x0
    );

  ri_to_c1_b2951b1d70: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => convert1_dout_net_x0,
      re => convert3_dout_net_x0,
      c => concat_y_net_x4
    );

  ri_to_c_f7870abfd7: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => convert2_dout_net_x0,
      re => convert_dout_net_x0,
      c => concat_y_net_x3
    );

  scale: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/mirror_spectrum/ri_to_c0"

entity ri_to_c0_entity_4f8026df01 is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c0_entity_4f8026df01;

architecture structural of ri_to_c0_entity_4f8026df01 is
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net: std_logic_vector(17 downto 0);
  signal force_re_output_port_net: std_logic_vector(17 downto 0);
  signal neg_delay0_q_net_x0: std_logic_vector(17 downto 0);
  signal negate0_op_net_x0: std_logic_vector(17 downto 0);

begin
  negate0_op_net_x0 <= im;
  neg_delay0_q_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_b198bd62b0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_9306b5127f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => negate0_op_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => neg_delay0_q_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/mirror_spectrum"

entity mirror_spectrum_entity_b557b633ee is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    din2: in std_logic_vector(35 downto 0); 
    din3: in std_logic_vector(35 downto 0); 
    reo_in0: in std_logic_vector(35 downto 0); 
    reo_in1: in std_logic_vector(35 downto 0); 
    reo_in2: in std_logic_vector(35 downto 0); 
    reo_in3: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0); 
    dout1: out std_logic_vector(35 downto 0); 
    dout2: out std_logic_vector(35 downto 0); 
    dout3: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end mirror_spectrum_entity_b557b633ee;

architecture structural of mirror_spectrum_entity_b557b633ee is
  signal ce_1_sg_x273: std_logic;
  signal clk_1_sg_x273: std_logic;
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal constant3_op_net: std_logic_vector(2 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay1_q_net: std_logic;
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(35 downto 0);
  signal delay4_q_net: std_logic_vector(35 downto 0);
  signal delay5_q_net: std_logic_vector(35 downto 0);
  signal delay6_q_net: std_logic_vector(35 downto 0);
  signal delay_ms1_q_net_x0: std_logic;
  signal delay_ms2_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms3_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_ms4_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms5_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_ms6_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms7_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_ms8_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms9_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux2_y_net_x0: std_logic_vector(35 downto 0);
  signal mux3_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x0: std_logic_vector(35 downto 0);
  signal neg_delay0_q_net_x0: std_logic_vector(17 downto 0);
  signal neg_delay1_q_net_x0: std_logic_vector(17 downto 0);
  signal neg_delay2_q_net_x0: std_logic_vector(17 downto 0);
  signal neg_delay3_q_net_x0: std_logic_vector(17 downto 0);
  signal negate0_op_net_x0: std_logic_vector(17 downto 0);
  signal negate1_op_net_x0: std_logic_vector(17 downto 0);
  signal negate2_op_net_x0: std_logic_vector(17 downto 0);
  signal negate3_op_net_x0: std_logic_vector(17 downto 0);
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x273 <= ce_1;
  clk_1_sg_x273 <= clk_1;
  delay_ms2_q_net_x0 <= din0;
  delay_ms4_q_net_x0 <= din1;
  delay_ms6_q_net_x0 <= din2;
  delay_ms8_q_net_x0 <= din3;
  delay_ms3_q_net_x1 <= reo_in0;
  delay_ms5_q_net_x1 <= reo_in1;
  delay_ms7_q_net_x1 <= reo_in2;
  delay_ms9_q_net_x1 <= reo_in3;
  delay_ms1_q_net_x0 <= sync;
  dout0 <= mux_y_net_x0;
  dout1 <= mux1_y_net_x0;
  dout2 <= mux2_y_net_x0;
  dout3 <= mux3_y_net_x0;
  sync_out <= delay2_q_net_x0;

  c_to_ri0_b1310b0927: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay_ms3_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  c_to_ri1_54cd7b63f2: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay_ms5_q_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri2_e06cf6036b: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay_ms7_q_net_x1,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri3_e9c294466f: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay_ms9_q_net_x1,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  constant3: entity work.constant_469094441c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      en => "1",
      rst(0) => delay1_q_net,
      op => counter_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d(0) => delay_ms1_q_net_x0,
      en => '1',
      q(0) => delay1_q_net
    );

  delay2: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d(0) => delay1_q_net,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d => delay_ms2_q_net_x0,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d => delay_ms4_q_net_x0,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d => delay_ms6_q_net_x0,
      en => '1',
      q => delay5_q_net
    );

  delay6: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d => delay_ms8_q_net_x0,
      en => '1',
      q => delay6_q_net
    );

  mux: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      d0 => delay3_q_net,
      d1 => concat_y_net_x0,
      sel(0) => relational_op_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      d0 => delay4_q_net,
      d1 => concat_y_net_x1,
      sel(0) => relational_op_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      d0 => delay5_q_net,
      d1 => concat_y_net_x2,
      sel(0) => relational_op_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      d0 => delay6_q_net,
      d1 => concat_y_net_x3,
      sel(0) => relational_op_net,
      y => mux3_y_net_x0
    );

  neg_delay0: entity work.delay_6699ee0916
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => force_re_output_port_net_x0,
      q => neg_delay0_q_net_x0
    );

  neg_delay1: entity work.delay_6699ee0916
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => force_re_output_port_net_x1,
      q => neg_delay1_q_net_x0
    );

  neg_delay2: entity work.delay_6699ee0916
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => force_re_output_port_net_x2,
      q => neg_delay2_q_net_x0
    );

  neg_delay3: entity work.delay_6699ee0916
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => force_re_output_port_net_x3,
      q => neg_delay3_q_net_x0
    );

  negate0: entity work.negate_6211d7a232
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      ip => force_im_output_port_net_x0,
      op => negate0_op_net_x0
    );

  negate1: entity work.negate_6211d7a232
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      ip => force_im_output_port_net_x1,
      op => negate1_op_net_x0
    );

  negate2: entity work.negate_6211d7a232
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      ip => force_im_output_port_net_x2,
      op => negate2_op_net_x0
    );

  negate3: entity work.negate_6211d7a232
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      ip => force_im_output_port_net_x3,
      op => negate3_op_net_x0
    );

  relational: entity work.relational_8968919e67
    port map (
      a => counter_op_net,
      b => constant3_op_net,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      op(0) => relational_op_net
    );

  ri_to_c0_4f8026df01: entity work.ri_to_c0_entity_4f8026df01
    port map (
      im => negate0_op_net_x0,
      re => neg_delay0_q_net_x0,
      c => concat_y_net_x0
    );

  ri_to_c1_8d5b725359: entity work.ri_to_c0_entity_4f8026df01
    port map (
      im => negate1_op_net_x0,
      re => neg_delay1_q_net_x0,
      c => concat_y_net_x1
    );

  ri_to_c2_880357a608: entity work.ri_to_c0_entity_4f8026df01
    port map (
      im => negate2_op_net_x0,
      re => neg_delay2_q_net_x0,
      c => concat_y_net_x2
    );

  ri_to_c3_4318a52652: entity work.ri_to_c0_entity_4f8026df01
    port map (
      im => negate3_op_net_x0,
      re => neg_delay3_q_net_x0,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/reorder_even/sync_delay_en"

entity sync_delay_en_entity_a9e4b4e52e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_en_entity_a9e4b4e52e;

architecture structural of sync_delay_en_entity_a9e4b4e52e is
  signal ce_1_sg_x274: std_logic;
  signal clk_1_sg_x274: std_logic;
  signal constant1_op_net: std_logic_vector(2 downto 0);
  signal constant2_op_net: std_logic_vector(2 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(2 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal logical1_y_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal or_y_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x274 <= ce_1;
  clk_1_sg_x274 <= clk_1;
  or_y_net_x0 <= en;
  pre_sync_delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_822933f89b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_469094441c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a1c496ea88
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_ff97ccbfc301b4b4",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x274,
      clk => clk_1_sg_x274,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical1_y_net,
      load(0) => pre_sync_delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net,
      d1(0) => or_y_net_x0,
      y(0) => logical1_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_8fc7f5539b
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_47b317dab6
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/reorder_even"

entity reorder_even_entity_df0c3913a8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end reorder_even_entity_df0c3913a8;

architecture structural of reorder_even_entity_df0c3913a8 is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal ce_1_sg_x275: std_logic;
  signal clk_1_sg_x275: std_logic;
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_d0_q_net: std_logic_vector(1 downto 0);
  signal delay_din0_q_net: std_logic_vector(35 downto 0);
  signal delay_map1_q_net: std_logic_vector(1 downto 0);
  signal delay_sel_q_net: std_logic;
  signal delay_we_q_net: std_logic;
  signal en_even_op_net_x0: std_logic;
  signal map1_data_net: std_logic_vector(1 downto 0);
  signal mux_y_net: std_logic_vector(1 downto 0);
  signal mux_y_net_x0: std_logic;
  signal or_y_net_x0: std_logic;
  signal post_sync_delay_q_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic_vector(1 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x275 <= ce_1;
  clk_1_sg_x275 <= clk_1;
  concat_y_net_x0 <= din0;
  en_even_op_net_x0 <= en;
  sync_delay_q_net_x0 <= sync;
  dout0 <= bram0_data_out_net_x0;
  sync_out <= post_sync_delay_q_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 2,
      c_width => 36,
      core_name0 => "bmg_33_91847195d057e656",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x0
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 7,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      clr => '0',
      en(0) => en_even_op_net_x0,
      rst(0) => sync_delay_q_net_x0,
      op => counter_op_net
    );

  delay_d0: entity work.delay_1782056a32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => slice2_y_net,
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      d => concat_y_net_x0,
      en => '1',
      q => delay_din0_q_net
    );

  delay_map1: entity work.delay_1782056a32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map1_data_net,
      q => delay_map1_q_net
    );

  delay_sel: entity work.delay_21355083c1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => slice1_y_net,
      q(0) => delay_sel_q_net
    );

  delay_we: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      d(0) => en_even_op_net_x0,
      en => '1',
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 2,
      core_name0 => "dmg_43_99fb347770ea8e40",
      latency => 0
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      en => "1",
      data => map1_data_net
    );

  mux: entity work.mux_c8f15d4aba
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      sel(0) => delay_sel_q_net,
      y => mux_y_net
    );

  or_x0: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => delay_we_q_net,
      y(0) => or_y_net_x0
    );

  post_sync_delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      d(0) => mux_y_net_x0,
      en => '1',
      q(0) => post_sync_delay_q_net_x0
    );

  pre_sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      d(0) => sync_delay_q_net_x0,
      en => '1',
      q(0) => pre_sync_delay_q_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 1,
      x_width => 3,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

  sync_delay_en_a9e4b4e52e: entity work.sync_delay_en_entity_a9e4b4e52e
    port map (
      ce_1 => ce_1_sg_x275,
      clk_1 => clk_1_sg_x275,
      en => or_y_net_x0,
      in_x0 => pre_sync_delay_q_net_x0,
      out_x0 => mux_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/reorder_odd"

entity reorder_odd_entity_8298f4a591 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0)
  );
end reorder_odd_entity_8298f4a591;

architecture structural of reorder_odd_entity_8298f4a591 is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal ce_1_sg_x276: std_logic;
  signal clk_1_sg_x276: std_logic;
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_d0_q_net: std_logic_vector(1 downto 0);
  signal delay_din0_q_net: std_logic_vector(35 downto 0);
  signal delay_map1_q_net: std_logic_vector(1 downto 0);
  signal delay_sel_q_net: std_logic;
  signal delay_we_q_net: std_logic;
  signal en_odd_op_net_x0: std_logic;
  signal map1_data_net: std_logic_vector(1 downto 0);
  signal mux_y_net: std_logic_vector(1 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic_vector(1 downto 0);
  signal sync_delay_q_net_x1: std_logic;

begin
  ce_1_sg_x276 <= ce_1;
  clk_1_sg_x276 <= clk_1;
  concat_y_net_x0 <= din0;
  en_odd_op_net_x0 <= en;
  sync_delay_q_net_x1 <= sync;
  dout0 <= bram0_data_out_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 2,
      c_width => 36,
      core_name0 => "bmg_33_91847195d057e656",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x0
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 7,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      clr => '0',
      en(0) => en_odd_op_net_x0,
      rst(0) => sync_delay_q_net_x1,
      op => counter_op_net
    );

  delay_d0: entity work.delay_1782056a32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => slice2_y_net,
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d => concat_y_net_x0,
      en => '1',
      q => delay_din0_q_net
    );

  delay_map1: entity work.delay_1782056a32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map1_data_net,
      q => delay_map1_q_net
    );

  delay_sel: entity work.delay_21355083c1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => slice1_y_net,
      q(0) => delay_sel_q_net
    );

  delay_we: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d(0) => en_odd_op_net_x0,
      en => '1',
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 2,
      core_name0 => "dmg_43_0c8b3d6f1ddea928",
      latency => 0
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      en => "1",
      data => map1_data_net
    );

  mux: entity work.mux_c8f15d4aba
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      sel(0) => delay_sel_q_net,
      y => mux_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 1,
      x_width => 3,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/reorder_out"

entity reorder_out_entity_45cfe9e0e5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    din2: in std_logic_vector(35 downto 0); 
    din3: in std_logic_vector(35 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0); 
    dout1: out std_logic_vector(35 downto 0); 
    dout2: out std_logic_vector(35 downto 0); 
    dout3: out std_logic_vector(35 downto 0)
  );
end reorder_out_entity_45cfe9e0e5;

architecture structural of reorder_out_entity_45cfe9e0e5 is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram2_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram3_data_out_net_x0: std_logic_vector(35 downto 0);
  signal ce_1_sg_x277: std_logic;
  signal clk_1_sg_x277: std_logic;
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_d0_q_net: std_logic_vector(1 downto 0);
  signal delay_din0_q_net: std_logic_vector(35 downto 0);
  signal delay_din1_q_net: std_logic_vector(35 downto 0);
  signal delay_din2_q_net: std_logic_vector(35 downto 0);
  signal delay_din3_q_net: std_logic_vector(35 downto 0);
  signal delay_map1_q_net: std_logic_vector(1 downto 0);
  signal delay_sel_q_net: std_logic;
  signal delay_srl_q_net_x2: std_logic_vector(35 downto 0);
  signal delay_srl_q_net_x3: std_logic_vector(35 downto 0);
  signal delay_srl_q_net_x4: std_logic;
  signal delay_we_q_net: std_logic;
  signal en_out_op_net_x0: std_logic;
  signal map1_data_net: std_logic_vector(1 downto 0);
  signal mux_y_net: std_logic_vector(1 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic_vector(1 downto 0);

begin
  ce_1_sg_x277 <= ce_1;
  clk_1_sg_x277 <= clk_1;
  delay_srl_q_net_x2 <= din0;
  delay_srl_q_net_x3 <= din1;
  concat_y_net_x4 <= din2;
  concat_y_net_x5 <= din3;
  en_out_op_net_x0 <= en;
  delay_srl_q_net_x4 <= sync;
  dout0 <= bram0_data_out_net_x0;
  dout1 <= bram1_data_out_net_x0;
  dout2 <= bram2_data_out_net_x0;
  dout3 <= bram3_data_out_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 2,
      c_width => 36,
      core_name0 => "bmg_33_91847195d057e656",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x0
    );

  bram1: entity work.xlspram
    generic map (
      c_address_width => 2,
      c_width => 36,
      core_name0 => "bmg_33_91847195d057e656",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      data_in => delay_din1_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram1_data_out_net_x0
    );

  bram2: entity work.xlspram
    generic map (
      c_address_width => 2,
      c_width => 36,
      core_name0 => "bmg_33_91847195d057e656",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      data_in => delay_din2_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram2_data_out_net_x0
    );

  bram3: entity work.xlspram
    generic map (
      c_address_width => 2,
      c_width => 36,
      core_name0 => "bmg_33_91847195d057e656",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      data_in => delay_din3_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram3_data_out_net_x0
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 7,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      clr => '0',
      en(0) => en_out_op_net_x0,
      rst(0) => delay_srl_q_net_x4,
      op => counter_op_net
    );

  delay_d0: entity work.delay_1782056a32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => slice2_y_net,
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      d => delay_srl_q_net_x2,
      en => '1',
      q => delay_din0_q_net
    );

  delay_din1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      d => delay_srl_q_net_x3,
      en => '1',
      q => delay_din1_q_net
    );

  delay_din2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      d => concat_y_net_x4,
      en => '1',
      q => delay_din2_q_net
    );

  delay_din3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      d => concat_y_net_x5,
      en => '1',
      q => delay_din3_q_net
    );

  delay_map1: entity work.delay_1782056a32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map1_data_net,
      q => delay_map1_q_net
    );

  delay_sel: entity work.delay_21355083c1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => slice1_y_net,
      q(0) => delay_sel_q_net
    );

  delay_we: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      d(0) => en_out_op_net_x0,
      en => '1',
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 2,
      core_name0 => "dmg_43_23851da6123ff17d",
      latency => 0
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      en => "1",
      data => map1_data_net
    );

  mux: entity work.mux_c8f15d4aba
    port map (
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      sel(0) => delay_sel_q_net,
      y => mux_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 1,
      x_width => 3,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x/sync_delay_srl"

entity sync_delay_srl_entity_b0c5c56bd1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_srl_entity_b0c5c56bd1;

architecture structural of sync_delay_srl_entity_b0c5c56bd1 is
  signal ce_1_sg_x278: std_logic;
  signal clk_1_sg_x278: std_logic;
  signal delay_ff_q_net: std_logic;
  signal delay_srl_q_net_x5: std_logic;
  signal post_sync_delay_q_net_x1: std_logic;

begin
  ce_1_sg_x278 <= ce_1;
  clk_1_sg_x278 <= clk_1;
  post_sync_delay_q_net_x1 <= in_x0;
  out_x0 <= delay_srl_q_net_x5;

  delay_ff: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d(0) => post_sync_delay_q_net_x1,
      en => '1',
      q(0) => delay_ff_q_net
    );

  delay_srl: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d(0) => delay_ff_q_net,
      en => '1',
      q(0) => delay_srl_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/bi_real_unscr_4x"

entity bi_real_unscr_4x_entity_9eb588e8ec is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    even: in std_logic_vector(35 downto 0); 
    odd: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    pol1_out: out std_logic_vector(35 downto 0); 
    pol2_out: out std_logic_vector(35 downto 0); 
    pol3_out: out std_logic_vector(35 downto 0); 
    pol4_out: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end bi_real_unscr_4x_entity_9eb588e8ec;

architecture structural of bi_real_unscr_4x_entity_9eb588e8ec is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x1: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x2: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram2_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram3_data_out_net_x0: std_logic_vector(35 downto 0);
  signal ce_1_sg_x279: std_logic;
  signal clk_1_sg_x279: std_logic;
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x8: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal constant0_op_net: std_logic_vector(2 downto 0);
  signal constant1_op_net: std_logic_vector(2 downto 0);
  signal counter0_op_net: std_logic_vector(2 downto 0);
  signal delay2_q_net_x1: std_logic;
  signal delay_ms1_q_net_x0: std_logic;
  signal delay_ms2_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms3_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_ms4_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms5_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_ms6_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms7_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_ms8_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_ms9_q_net_x1: std_logic_vector(35 downto 0);
  signal delay_q_net: std_logic_vector(35 downto 0);
  signal delay_srl_q_net_x2: std_logic_vector(35 downto 0);
  signal delay_srl_q_net_x3: std_logic_vector(35 downto 0);
  signal delay_srl_q_net_x5: std_logic;
  signal en_even_op_net_x0: std_logic;
  signal en_odd_op_net_x0: std_logic;
  signal en_out_op_net_x0: std_logic;
  signal mux0_y_net_x1: std_logic_vector(35 downto 0);
  signal mux1_y_net_x1: std_logic_vector(35 downto 0);
  signal mux1_y_net_x2: std_logic_vector(35 downto 0);
  signal mux2_y_net_x1: std_logic_vector(35 downto 0);
  signal mux2_y_net_x2: std_logic_vector(35 downto 0);
  signal mux3_y_net_x1: std_logic_vector(35 downto 0);
  signal mux3_y_net_x2: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal post_sync_delay_q_net_x1: std_logic;
  signal relational0_op_net: std_logic;
  signal relational1_op_net: std_logic;
  signal sync_delay_q_net_x2: std_logic;

begin
  ce_1_sg_x279 <= ce_1;
  clk_1_sg_x279 <= clk_1;
  concat_y_net_x8 <= even;
  concat_y_net_x9 <= odd;
  sync_delay_q_net_x2 <= sync;
  pol1_out <= mux_y_net_x1;
  pol2_out <= mux1_y_net_x2;
  pol3_out <= mux2_y_net_x2;
  pol4_out <= mux3_y_net_x2;
  sync_out <= delay2_q_net_x1;

  constant0: entity work.constant_469094441c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant0_op_net
    );

  constant1: entity work.constant_822933f89b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  counter0: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x279,
      clk => clk_1_sg_x279,
      clr => '0',
      en => "1",
      rst(0) => post_sync_delay_q_net_x1,
      op => counter0_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x279,
      clk => clk_1_sg_x279,
      d => bram0_data_out_net_x1,
      en => '1',
      q => delay_q_net
    );

  delay_ms1: entity work.delay_0341f7be44
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => delay_srl_q_net_x5,
      q(0) => delay_ms1_q_net_x0
    );

  delay_ms2: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => delay_srl_q_net_x2,
      q => delay_ms2_q_net_x0
    );

  delay_ms3: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => bram0_data_out_net_x2,
      q => delay_ms3_q_net_x1
    );

  delay_ms4: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => delay_srl_q_net_x3,
      q => delay_ms4_q_net_x0
    );

  delay_ms5: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => bram1_data_out_net_x0,
      q => delay_ms5_q_net_x1
    );

  delay_ms6: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x5,
      q => delay_ms6_q_net_x0
    );

  delay_ms7: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => bram2_data_out_net_x0,
      q => delay_ms7_q_net_x1
    );

  delay_ms8: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x6,
      q => delay_ms8_q_net_x0
    );

  delay_ms9: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => bram3_data_out_net_x0,
      q => delay_ms9_q_net_x1
    );

  delay_srl0_6771a4f5a8: entity work.delay_srl0_entity_6771a4f5a8
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      in_x0 => concat_y_net_x3,
      out_x0 => delay_srl_q_net_x2
    );

  delay_srl1_0265985d27: entity work.delay_srl0_entity_6771a4f5a8
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      in_x0 => concat_y_net_x4,
      out_x0 => delay_srl_q_net_x3
    );

  en_even: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => en_even_op_net_x0
    );

  en_odd: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => en_odd_op_net_x0
    );

  en_out: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => en_out_op_net_x0
    );

  hilbert0_78b8cb99bf: entity work.hilbert0_entity_78b8cb99bf
    port map (
      a => mux0_y_net_x1,
      b => mux1_y_net_x1,
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      even => concat_y_net_x3,
      odd => concat_y_net_x4
    );

  hilbert1_8e9b00d5d0: entity work.hilbert0_entity_78b8cb99bf
    port map (
      a => mux2_y_net_x1,
      b => mux3_y_net_x1,
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      even => concat_y_net_x5,
      odd => concat_y_net_x6
    );

  mirror_spectrum_b557b633ee: entity work.mirror_spectrum_entity_b557b633ee
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      din0 => delay_ms2_q_net_x0,
      din1 => delay_ms4_q_net_x0,
      din2 => delay_ms6_q_net_x0,
      din3 => delay_ms8_q_net_x0,
      reo_in0 => delay_ms3_q_net_x1,
      reo_in1 => delay_ms5_q_net_x1,
      reo_in2 => delay_ms7_q_net_x1,
      reo_in3 => delay_ms9_q_net_x1,
      sync => delay_ms1_q_net_x0,
      dout0 => mux_y_net_x1,
      dout1 => mux1_y_net_x2,
      dout2 => mux2_y_net_x2,
      dout3 => mux3_y_net_x2,
      sync_out => delay2_q_net_x1
    );

  mux0: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x279,
      clk => clk_1_sg_x279,
      clr => '0',
      d0 => bram0_data_out_net_x0,
      d1 => delay_q_net,
      sel(0) => relational0_op_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x279,
      clk => clk_1_sg_x279,
      clr => '0',
      d0 => delay_q_net,
      d1 => bram0_data_out_net_x0,
      sel(0) => relational1_op_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x279,
      clk => clk_1_sg_x279,
      clr => '0',
      d0 => bram0_data_out_net_x0,
      d1 => delay_q_net,
      sel(0) => relational1_op_net,
      y => mux2_y_net_x1
    );

  mux3: entity work.mux_fca786f2ff
    port map (
      ce => ce_1_sg_x279,
      clk => clk_1_sg_x279,
      clr => '0',
      d0 => delay_q_net,
      d1 => bram0_data_out_net_x0,
      sel(0) => relational0_op_net,
      y => mux3_y_net_x1
    );

  relational0: entity work.relational_8fc7f5539b
    port map (
      a => constant0_op_net,
      b => counter0_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational0_op_net
    );

  relational1: entity work.relational_8fc7f5539b
    port map (
      a => counter0_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

  reorder_even_df0c3913a8: entity work.reorder_even_entity_df0c3913a8
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      din0 => concat_y_net_x8,
      en => en_even_op_net_x0,
      sync => sync_delay_q_net_x2,
      dout0 => bram0_data_out_net_x0,
      sync_out => post_sync_delay_q_net_x1
    );

  reorder_odd_8298f4a591: entity work.reorder_odd_entity_8298f4a591
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      din0 => concat_y_net_x9,
      en => en_odd_op_net_x0,
      sync => sync_delay_q_net_x2,
      dout0 => bram0_data_out_net_x1
    );

  reorder_out_45cfe9e0e5: entity work.reorder_out_entity_45cfe9e0e5
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      din0 => delay_srl_q_net_x2,
      din1 => delay_srl_q_net_x3,
      din2 => concat_y_net_x5,
      din3 => concat_y_net_x6,
      en => en_out_op_net_x0,
      sync => delay_srl_q_net_x5,
      dout0 => bram0_data_out_net_x2,
      dout1 => bram1_data_out_net_x0,
      dout2 => bram2_data_out_net_x0,
      dout3 => bram3_data_out_net_x0
    );

  sync_delay_srl_b0c5c56bd1: entity work.sync_delay_srl_entity_b0c5c56bd1
    port map (
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      in_x0 => post_sync_delay_q_net_x1,
      out_x0 => delay_srl_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1/butterfly_direct/convert_of0/convert"

entity convert_entity_f3b22433b6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(19 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end convert_entity_f3b22433b6;

architecture structural of convert_entity_f3b22433b6 is
  signal adder_s_net_x0: std_logic_vector(17 downto 0);
  signal almost_half_op_net: std_logic_vector(18 downto 0);
  signal bit_y_net: std_logic;
  signal ce_1_sg_x280: std_logic;
  signal clk_1_sg_x280: std_logic;
  signal concat_y_net: std_logic_vector(20 downto 0);
  signal constant_op_net: std_logic;
  signal force1_output_port_net: std_logic_vector(20 downto 0);
  signal force2_output_port_net: std_logic_vector(18 downto 0);
  signal mux0_y_net_x0: std_logic_vector(19 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(19 downto 0);
  signal tweak_op_y_net: std_logic;

begin
  ce_1_sg_x280 <= ce_1;
  clk_1_sg_x280 <= clk_1;
  mux0_y_net_x0 <= in_x0;
  out_x0 <= adder_s_net_x0;

  adder: entity work.addsub_036990b294
    port map (
      a => force1_output_port_net,
      b => force2_output_port_net,
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      clr => '0',
      s => adder_s_net_x0
    );

  almost_half: entity work.constant_4709ea49b5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => almost_half_op_net
    );

  bit: entity work.xlslice
    generic map (
      new_lsb => 19,
      new_msb => 19,
      x_width => 20,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x0,
      y(0) => bit_y_net
    );

  concat: entity work.concat_c615d93998
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret_output_port_net,
      in1(0) => tweak_op_y_net,
      y => concat_y_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  force1: entity work.reinterpret_d357e69fa3
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => force1_output_port_net
    );

  force2: entity work.reinterpret_d2180c9169
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => almost_half_op_net,
      output_port => force2_output_port_net
    );

  reinterpret: entity work.reinterpret_4a8cbc85ce
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux0_y_net_x0,
      output_port => reinterpret_output_port_net
    );

  tweak_op: entity work.logical_9d76333483
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => bit_y_net,
      d1(0) => constant_op_net,
      y(0) => tweak_op_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1/butterfly_direct/convert_of0"

entity convert_of0_entity_96db4e14c4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(19 downto 0); 
    dout: out std_logic_vector(17 downto 0); 
    of_x0: out std_logic
  );
end convert_of0_entity_96db4e14c4;

architecture structural of convert_of0_entity_96db4e14c4 is
  signal adder_s_net_x1: std_logic_vector(17 downto 0);
  signal all_0s_y_net: std_logic;
  signal all_1s_y_net: std_logic;
  signal and_y_net_x0: std_logic;
  signal ce_1_sg_x281: std_logic;
  signal clk_1_sg_x281: std_logic;
  signal invert1_op_net: std_logic;
  signal invert2_op_net: std_logic;
  signal mux0_y_net_x1: std_logic_vector(19 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic;

begin
  ce_1_sg_x281 <= ce_1;
  clk_1_sg_x281 <= clk_1;
  mux0_y_net_x1 <= din;
  dout <= adder_s_net_x1;
  of_x0 <= and_y_net_x0;

  all_0s: entity work.logical_e9e6541380
    port map (
      ce => ce_1_sg_x281,
      clk => clk_1_sg_x281,
      clr => '0',
      d0(0) => invert1_op_net,
      d1(0) => invert2_op_net,
      y(0) => all_0s_y_net
    );

  all_1s: entity work.logical_e9e6541380
    port map (
      ce => ce_1_sg_x281,
      clk => clk_1_sg_x281,
      clr => '0',
      d0(0) => slice1_y_net,
      d1(0) => slice2_y_net,
      y(0) => all_1s_y_net
    );

  and_x0: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => all_0s_y_net,
      d1(0) => all_1s_y_net,
      y(0) => and_y_net_x0
    );

  convert_f3b22433b6: entity work.convert_entity_f3b22433b6
    port map (
      ce_1 => ce_1_sg_x281,
      clk_1 => clk_1_sg_x281,
      in_x0 => mux0_y_net_x1,
      out_x0 => adder_s_net_x1
    );

  invert1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x281,
      clk => clk_1_sg_x281,
      clr => '0',
      ip(0) => slice1_y_net,
      op(0) => invert1_op_net
    );

  invert2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x281,
      clk => clk_1_sg_x281,
      clr => '0',
      ip(0) => slice2_y_net,
      op(0) => invert2_op_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 19,
      new_msb => 19,
      x_width => 20,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x1,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 18,
      x_width => 20,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x1,
      y(0) => slice2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1/butterfly_direct/twiddle_pass_through"

entity twiddle_pass_through_entity_18d8c7e744 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(17 downto 0); 
    bw_re: out std_logic_vector(17 downto 0)
  );
end twiddle_pass_through_entity_18d8c7e744;

architecture structural of twiddle_pass_through_entity_18d8c7e744 is
  signal delay_slr_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);

begin
  delay_slr_q_net_x1 <= a;
  mux_y_net_x1 <= b;
  a_im <= force_im_output_port_net_x2;
  a_re <= force_re_output_port_net_x2;
  bw_im <= force_im_output_port_net_x3;
  bw_re <= force_re_output_port_net_x3;

  c_to_ri1_137660c018: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => mux_y_net_x1,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri_ef9a995363: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay_slr_q_net_x1,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1/butterfly_direct"

entity butterfly_direct_entity_56f5a4f4ed is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    of_x0: out std_logic; 
    sync_out: out std_logic
  );
end butterfly_direct_entity_56f5a4f4ed;

architecture structural of butterfly_direct_entity_56f5a4f4ed is
  signal adder_s_net_x3: std_logic_vector(17 downto 0);
  signal adder_s_net_x4: std_logic_vector(17 downto 0);
  signal adder_s_net_x5: std_logic_vector(17 downto 0);
  signal adder_s_net_x6: std_logic_vector(17 downto 0);
  signal addsub0_s_net: std_logic_vector(18 downto 0);
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal and_y_net_x0: std_logic;
  signal and_y_net_x1: std_logic;
  signal and_y_net_x2: std_logic;
  signal and_y_net_x3: std_logic;
  signal ce_1_sg_x288: std_logic;
  signal clk_1_sg_x288: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal logical_y_net_x0: std_logic;
  signal mux0_y_net_x1: std_logic_vector(19 downto 0);
  signal mux1_y_net_x1: std_logic_vector(19 downto 0);
  signal mux2_y_net_x1: std_logic_vector(19 downto 0);
  signal mux3_y_net_x1: std_logic_vector(19 downto 0);
  signal mux_y_net_x0: std_logic;
  signal mux_y_net_x2: std_logic_vector(35 downto 0);
  signal scale0_op_net: std_logic_vector(18 downto 0);
  signal scale1_op_net: std_logic_vector(18 downto 0);
  signal scale2_op_net: std_logic_vector(18 downto 0);
  signal scale3_op_net: std_logic_vector(18 downto 0);
  signal shift_delay_q_net: std_logic;
  signal slice_y_net_x0: std_logic;
  signal sync_delay_q_net_x0: std_logic;

begin
  delay_slr_q_net_x2 <= a;
  mux_y_net_x2 <= b;
  ce_1_sg_x288 <= ce_1;
  clk_1_sg_x288 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x0 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  of_x0 <= logical_y_net_x0;
  sync_out <= sync_delay_q_net_x0;

  addsub0: entity work.addsub_e140b59ec8
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x3,
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      s => addsub0_s_net
    );

  addsub1: entity work.addsub_e140b59ec8
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x3,
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_7461f1deba
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x3,
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_7461f1deba
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x3,
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of0_96db4e14c4: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      din => mux0_y_net_x1,
      dout => adder_s_net_x3,
      of_x0 => and_y_net_x0
    );

  convert_of1_5379a531c8: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      din => mux1_y_net_x1,
      dout => adder_s_net_x4,
      of_x0 => and_y_net_x1
    );

  convert_of2_15b93b755e: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      din => mux2_y_net_x1,
      dout => adder_s_net_x5,
      of_x0 => and_y_net_x2
    );

  convert_of3_c2dfaf18b9: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      din => mux3_y_net_x1,
      dout => adder_s_net_x6,
      of_x0 => and_y_net_x3
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => and_y_net_x0,
      d1(0) => and_y_net_x1,
      d2(0) => and_y_net_x2,
      d3(0) => and_y_net_x3,
      y(0) => logical_y_net_x0
    );

  mux0: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      d0 => addsub0_s_net,
      d1 => scale0_op_net,
      sel(0) => shift_delay_q_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => shift_delay_q_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => shift_delay_q_net,
      y => mux2_y_net_x1
    );

  mux3: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => shift_delay_q_net,
      y => mux3_y_net_x1
    );

  ri_to_c01_48122794fa: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x4,
      re => adder_s_net_x3,
      c => concat_y_net_x2
    );

  ri_to_c23_dffc2e54b2: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x6,
      re => adder_s_net_x5,
      c => concat_y_net_x3
    );

  scale0: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub0_s_net,
      op => scale0_op_net
    );

  scale1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  shift_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => shift_delay_q_net
    );

  sync_delay: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      d(0) => mux_y_net_x0,
      q(0) => sync_delay_q_net_x0
    );

  twiddle_pass_through_18d8c7e744: entity work.twiddle_pass_through_entity_18d8c7e744
    port map (
      a => delay_slr_q_net_x2,
      b => mux_y_net_x2,
      a_im => force_im_output_port_net_x2,
      a_re => force_re_output_port_net_x2,
      bw_im => force_im_output_port_net_x3,
      bw_re => force_re_output_port_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1/delay_b"

entity delay_b_entity_a5b250a0af is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_a5b250a0af;

architecture structural of delay_b_entity_a5b250a0af is
  signal ce_1_sg_x289: std_logic;
  signal clk_1_sg_x289: std_logic;
  signal delay_slr_q_net_x3: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x289 <= ce_1;
  clk_1_sg_x289 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= delay_slr_q_net_x3;

  delay_slr: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x289,
      clk => clk_1_sg_x289,
      d => mux1_y_net_x0,
      en => '1',
      q => delay_slr_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1/sync_delay"

entity sync_delay_entity_62c3cf665b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_62c3cf665b;

architecture structural of sync_delay_entity_62c3cf665b is
  signal ce_1_sg_x291: std_logic;
  signal clk_1_sg_x291: std_logic;
  signal constant1_op_net: std_logic_vector(2 downto 0);
  signal constant2_op_net: std_logic_vector(2 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(2 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x1: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x291 <= ce_1;
  clk_1_sg_x291 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x1;

  constant1: entity work.constant_822933f89b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_469094441c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a1c496ea88
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_ff97ccbfc301b4b4",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x1
    );

  relational: entity work.relational_8fc7f5539b
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_47b317dab6
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_1"

entity fft_stage_1_entity_c4b4a9bbba is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    of_in: in std_logic; 
    shift: in std_logic_vector(12 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_1_entity_c4b4a9bbba;

architecture structural of fft_stage_1_entity_c4b4a9bbba is
  signal ce_1_sg_x292: std_logic;
  signal clk_1_sg_x292: std_logic;
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal constant_op_net_x0: std_logic;
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x3: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic;
  signal mux_y_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice6_y_net_x0: std_logic_vector(12 downto 0);
  signal slice_y_net_x0: std_logic;
  signal sync_delay_q_net_x1: std_logic;

begin
  ce_1_sg_x292 <= ce_1;
  clk_1_sg_x292 <= clk_1;
  concat_y_net_x4 <= in1;
  concat_y_net_x5 <= in2;
  constant_op_net_x0 <= of_in;
  slice6_y_net_x0 <= shift;
  delay_q_net_x2 <= sync;
  of_x0 <= logical1_y_net_x0;
  out1 <= concat_y_net_x6;
  out2 <= concat_y_net_x7;
  sync_out <= sync_delay_q_net_x1;

  butterfly_direct_56f5a4f4ed: entity work.butterfly_direct_entity_56f5a4f4ed
    port map (
      a => delay_slr_q_net_x3,
      b => mux_y_net_x2,
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      shift => slice_y_net_x0,
      sync => mux_y_net_x1,
      a_bw => concat_y_net_x6,
      a_bw_x0 => concat_y_net_x7,
      of_x0 => logical_y_net_x0,
      sync_out => sync_delay_q_net_x1
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x2,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      d(0) => delay_q_net_x2,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_a5b250a0af: entity work.delay_b_entity_a5b250a0af
    port map (
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      in1 => mux1_y_net_x0,
      out1 => delay_slr_q_net_x3
    );

  delay_f_a7c208a254: entity work.delay_b_entity_a5b250a0af
    port map (
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      in1 => concat_y_net_x5,
      out1 => delay_slr_q_net_x0
    );

  logical1: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => constant_op_net_x0,
      y(0) => logical1_y_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      d0 => delay_slr_q_net_x0,
      d1 => concat_y_net_x4,
      sel(0) => slice1_y_net,
      y => mux_y_net_x2
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      d0 => concat_y_net_x4,
      d1 => delay_slr_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 13,
      y_width => 1
    )
    port map (
      x => slice6_y_net_x0,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_62c3cf665b: entity work.sync_delay_entity_62c3cf665b
    port map (
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      in_x0 => delay_q_net_x1,
      out_x0 => mux_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_2/butterfly_direct/twiddle_stage_2"

entity twiddle_stage_2_entity_473a9e4e1f is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(17 downto 0); 
    bw_re: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end twiddle_stage_2_entity_473a9e4e1f;

architecture structural of twiddle_stage_2_entity_473a9e4e1f is
  signal ce_1_sg_x301: std_logic;
  signal clk_1_sg_x301: std_logic;
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay0_q_net_x0: std_logic_vector(17 downto 0);
  signal delay1_q_net_x0: std_logic_vector(17 downto 0);
  signal delay2_q_net: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay6_q_net: std_logic_vector(17 downto 0);
  signal delay7_q_net: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal delay_slr_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal mux0_y_net_x0: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal negate_op_net: std_logic_vector(18 downto 0);
  signal slice_y_net: std_logic;

begin
  delay_slr_q_net_x1 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x301 <= ce_1;
  clk_1_sg_x301 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= delay1_q_net_x0;
  a_re <= delay0_q_net_x0;
  bw_im <= mux1_y_net_x0;
  bw_re <= mux0_y_net_x0;
  sync_out <= delay8_q_net_x0;

  c_to_ri1_2cb5b883c1: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => mux_y_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_6307945e27: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay_slr_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      din => negate_op_net,
      dout => convert_dout_net
    );

  counter: entity work.counter_107ada62c3
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      rst(0) => delay7_q_net,
      op => counter_op_net
    );

  delay0: entity work.delay_4217913c13
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d => force_re_output_port_net_x0,
      q => delay0_q_net_x0
    );

  delay1: entity work.delay_4217913c13
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d => force_im_output_port_net_x0,
      q => delay1_q_net_x0
    );

  delay2: entity work.delay_85c2ef968b
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d(0) => slice_y_net,
      q(0) => delay2_q_net
    );

  delay3: entity work.delay_328e8ebbb5
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d => delay6_q_net,
      q => delay3_q_net
    );

  delay4: entity work.delay_328e8ebbb5
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d => convert_dout_net,
      q => delay4_q_net
    );

  delay5: entity work.delay_cbdfa55dc3
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d => force_re_output_port_net_x1,
      q => delay5_q_net
    );

  delay6: entity work.delay_cbdfa55dc3
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d => force_im_output_port_net_x1,
      q => delay6_q_net
    );

  delay7: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d(0) => mux_y_net_x2,
      q(0) => delay7_q_net
    );

  delay8: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d(0) => delay7_q_net,
      q(0) => delay8_q_net_x0
    );

  mux0: entity work.mux_74a3397f06
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d0 => delay5_q_net,
      d1 => delay6_q_net,
      sel(0) => slice_y_net,
      y => mux0_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      d0 => delay3_q_net,
      d1 => delay4_q_net,
      sel(0) => delay2_q_net,
      y => mux1_y_net_x0
    );

  negate: entity work.negate_e1a9d1ade1
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      ip => force_re_output_port_net_x1,
      op => negate_op_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_2/butterfly_direct"

entity butterfly_direct_entity_fc87b7aa2f is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    of_x0: out std_logic; 
    sync_out: out std_logic
  );
end butterfly_direct_entity_fc87b7aa2f;

architecture structural of butterfly_direct_entity_fc87b7aa2f is
  signal adder_s_net_x3: std_logic_vector(17 downto 0);
  signal adder_s_net_x4: std_logic_vector(17 downto 0);
  signal adder_s_net_x5: std_logic_vector(17 downto 0);
  signal adder_s_net_x6: std_logic_vector(17 downto 0);
  signal addsub0_s_net: std_logic_vector(18 downto 0);
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal and_y_net_x0: std_logic;
  signal and_y_net_x1: std_logic;
  signal and_y_net_x2: std_logic;
  signal and_y_net_x3: std_logic;
  signal ce_1_sg_x302: std_logic;
  signal clk_1_sg_x302: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal delay0_q_net_x0: std_logic_vector(17 downto 0);
  signal delay1_q_net_x0: std_logic_vector(17 downto 0);
  signal delay8_q_net_x0: std_logic;
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal logical_y_net_x0: std_logic;
  signal mux0_y_net_x0: std_logic_vector(17 downto 0);
  signal mux0_y_net_x1: std_logic_vector(19 downto 0);
  signal mux1_y_net_x0: std_logic_vector(17 downto 0);
  signal mux1_y_net_x1: std_logic_vector(19 downto 0);
  signal mux2_y_net_x1: std_logic_vector(19 downto 0);
  signal mux3_y_net_x1: std_logic_vector(19 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale0_op_net: std_logic_vector(18 downto 0);
  signal scale1_op_net: std_logic_vector(18 downto 0);
  signal scale2_op_net: std_logic_vector(18 downto 0);
  signal scale3_op_net: std_logic_vector(18 downto 0);
  signal shift_delay_q_net: std_logic;
  signal slice_y_net_x0: std_logic;
  signal sync_delay_q_net_x0: std_logic;

begin
  delay_slr_q_net_x2 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x302 <= ce_1;
  clk_1_sg_x302 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  of_x0 <= logical_y_net_x0;
  sync_out <= sync_delay_q_net_x0;

  addsub0: entity work.addsub_e140b59ec8
    port map (
      a => delay0_q_net_x0,
      b => mux0_y_net_x0,
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      s => addsub0_s_net
    );

  addsub1: entity work.addsub_e140b59ec8
    port map (
      a => delay1_q_net_x0,
      b => mux1_y_net_x0,
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_7461f1deba
    port map (
      a => delay0_q_net_x0,
      b => mux0_y_net_x0,
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_7461f1deba
    port map (
      a => delay1_q_net_x0,
      b => mux1_y_net_x0,
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of0_c832f0e5df: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      din => mux0_y_net_x1,
      dout => adder_s_net_x3,
      of_x0 => and_y_net_x0
    );

  convert_of1_9e71cdd110: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      din => mux1_y_net_x1,
      dout => adder_s_net_x4,
      of_x0 => and_y_net_x1
    );

  convert_of2_f8a41715b7: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      din => mux2_y_net_x1,
      dout => adder_s_net_x5,
      of_x0 => and_y_net_x2
    );

  convert_of3_6903f2cada: entity work.convert_of0_entity_96db4e14c4
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      din => mux3_y_net_x1,
      dout => adder_s_net_x6,
      of_x0 => and_y_net_x3
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => and_y_net_x0,
      d1(0) => and_y_net_x1,
      d2(0) => and_y_net_x2,
      d3(0) => and_y_net_x3,
      y(0) => logical_y_net_x0
    );

  mux0: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      d0 => addsub0_s_net,
      d1 => scale0_op_net,
      sel(0) => shift_delay_q_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => shift_delay_q_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => shift_delay_q_net,
      y => mux2_y_net_x1
    );

  mux3: entity work.mux_28159dbdb9
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => shift_delay_q_net,
      y => mux3_y_net_x1
    );

  ri_to_c01_685fc41686: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x4,
      re => adder_s_net_x3,
      c => concat_y_net_x2
    );

  ri_to_c23_0d4114a700: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x6,
      re => adder_s_net_x5,
      c => concat_y_net_x3
    );

  scale0: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub0_s_net,
      op => scale0_op_net
    );

  scale1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  shift_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => shift_delay_q_net
    );

  sync_delay: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      clr => '0',
      d(0) => delay8_q_net_x0,
      q(0) => sync_delay_q_net_x0
    );

  twiddle_stage_2_473a9e4e1f: entity work.twiddle_stage_2_entity_473a9e4e1f
    port map (
      a => delay_slr_q_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      sync => mux_y_net_x4,
      a_im => delay1_q_net_x0,
      a_re => delay0_q_net_x0,
      bw_im => mux1_y_net_x0,
      bw_re => mux0_y_net_x0,
      sync_out => delay8_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_2/delay_b"

entity delay_b_entity_ff136bc3bc is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_ff136bc3bc;

architecture structural of delay_b_entity_ff136bc3bc is
  signal ce_1_sg_x303: std_logic;
  signal clk_1_sg_x303: std_logic;
  signal delay_slr_q_net_x3: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x303 <= ce_1;
  clk_1_sg_x303 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= delay_slr_q_net_x3;

  delay_slr: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x303,
      clk => clk_1_sg_x303,
      d => mux1_y_net_x0,
      en => '1',
      q => delay_slr_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_2/sync_delay"

entity sync_delay_entity_d9dc204724 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_d9dc204724;

architecture structural of sync_delay_entity_d9dc204724 is
  signal ce_1_sg_x305: std_logic;
  signal clk_1_sg_x305: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant2_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x305 <= ce_1;
  clk_1_sg_x305 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_9b3867ea8e1e20fc",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x305,
      clk => clk_1_sg_x305,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_5f1eb17108
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_f9928864ea
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_2"

entity fft_stage_2_entity_40dcc1950c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    of_in: in std_logic; 
    shift: in std_logic_vector(12 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_2_entity_40dcc1950c;

architecture structural of fft_stage_2_entity_40dcc1950c is
  signal ce_1_sg_x306: std_logic;
  signal clk_1_sg_x306: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x3: std_logic_vector(35 downto 0);
  signal logical1_y_net_x1: std_logic;
  signal logical1_y_net_x2: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal slice1_y_net: std_logic;
  signal slice6_y_net_x1: std_logic_vector(12 downto 0);
  signal slice_y_net_x0: std_logic;
  signal sync_delay_q_net_x2: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x306 <= ce_1;
  clk_1_sg_x306 <= clk_1;
  concat_y_net_x7 <= in1;
  concat_y_net_x9 <= in2;
  logical1_y_net_x1 <= of_in;
  slice6_y_net_x1 <= shift;
  sync_delay_q_net_x2 <= sync;
  of_x0 <= logical1_y_net_x2;
  out1 <= concat_y_net_x10;
  out2 <= concat_y_net_x11;
  sync_out <= sync_delay_q_net_x3;

  butterfly_direct_fc87b7aa2f: entity work.butterfly_direct_entity_fc87b7aa2f
    port map (
      a => delay_slr_q_net_x3,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x306,
      clk_1 => clk_1_sg_x306,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x10,
      a_bw_x0 => concat_y_net_x11,
      of_x0 => logical_y_net_x0,
      sync_out => sync_delay_q_net_x3
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_fb8caae5ebc5d253",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x2,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      d(0) => sync_delay_q_net_x2,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_ff136bc3bc: entity work.delay_b_entity_ff136bc3bc
    port map (
      ce_1 => ce_1_sg_x306,
      clk_1 => clk_1_sg_x306,
      in1 => mux1_y_net_x0,
      out1 => delay_slr_q_net_x3
    );

  delay_f_e3da343551: entity work.delay_b_entity_ff136bc3bc
    port map (
      ce_1 => ce_1_sg_x306,
      clk_1 => clk_1_sg_x306,
      in1 => concat_y_net_x9,
      out1 => delay_slr_q_net_x0
    );

  logical1: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => logical1_y_net_x1,
      y(0) => logical1_y_net_x2
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      d0 => delay_slr_q_net_x0,
      d1 => concat_y_net_x7,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      d0 => concat_y_net_x7,
      d1 => delay_slr_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 13,
      y_width => 1
    )
    port map (
      x => slice6_y_net_x1,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_d9dc204724: entity work.sync_delay_entity_d9dc204724
    port map (
      ce_1 => ce_1_sg_x306,
      clk_1 => clk_1_sg_x306,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct/convert_of0/convert"

entity convert_entity_63ee1a903a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(23 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end convert_entity_63ee1a903a;

architecture structural of convert_entity_63ee1a903a is
  signal adder_s_net_x0: std_logic_vector(17 downto 0);
  signal almost_half_op_net: std_logic_vector(20 downto 0);
  signal bit_y_net: std_logic;
  signal ce_1_sg_x307: std_logic;
  signal clk_1_sg_x307: std_logic;
  signal concat_y_net: std_logic_vector(24 downto 0);
  signal constant_op_net: std_logic;
  signal force1_output_port_net: std_logic_vector(24 downto 0);
  signal force2_output_port_net: std_logic_vector(20 downto 0);
  signal mux0_y_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);
  signal tweak_op_y_net: std_logic;

begin
  ce_1_sg_x307 <= ce_1;
  clk_1_sg_x307 <= clk_1;
  mux0_y_net_x0 <= in_x0;
  out_x0 <= adder_s_net_x0;

  adder: entity work.addsub_1593c8c405
    port map (
      a => force1_output_port_net,
      b => force2_output_port_net,
      ce => ce_1_sg_x307,
      clk => clk_1_sg_x307,
      clr => '0',
      s => adder_s_net_x0
    );

  almost_half: entity work.constant_9a2c97cce5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => almost_half_op_net
    );

  bit: entity work.xlslice
    generic map (
      new_lsb => 23,
      new_msb => 23,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x0,
      y(0) => bit_y_net
    );

  concat: entity work.concat_f133931c1f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret_output_port_net,
      in1(0) => tweak_op_y_net,
      y => concat_y_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  force1: entity work.reinterpret_60ea556961
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => force1_output_port_net
    );

  force2: entity work.reinterpret_299ca43e25
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => almost_half_op_net,
      output_port => force2_output_port_net
    );

  reinterpret: entity work.reinterpret_3fb4604c01
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux0_y_net_x0,
      output_port => reinterpret_output_port_net
    );

  tweak_op: entity work.logical_9d76333483
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => bit_y_net,
      d1(0) => constant_op_net,
      y(0) => tweak_op_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct/convert_of0"

entity convert_of0_entity_ac01265455 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout: out std_logic_vector(17 downto 0); 
    of_x0: out std_logic
  );
end convert_of0_entity_ac01265455;

architecture structural of convert_of0_entity_ac01265455 is
  signal adder_s_net_x1: std_logic_vector(17 downto 0);
  signal all_0s_y_net: std_logic;
  signal all_1s_y_net: std_logic;
  signal and_y_net_x0: std_logic;
  signal ce_1_sg_x308: std_logic;
  signal clk_1_sg_x308: std_logic;
  signal invert1_op_net: std_logic;
  signal invert2_op_net: std_logic;
  signal invert3_op_net: std_logic;
  signal invert4_op_net: std_logic;
  signal mux0_y_net_x1: std_logic_vector(23 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic;
  signal slice3_y_net: std_logic;
  signal slice4_y_net: std_logic;

begin
  ce_1_sg_x308 <= ce_1;
  clk_1_sg_x308 <= clk_1;
  mux0_y_net_x1 <= din;
  dout <= adder_s_net_x1;
  of_x0 <= and_y_net_x0;

  all_0s: entity work.logical_182ac6c51e
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      d0(0) => invert1_op_net,
      d1(0) => invert2_op_net,
      d2(0) => invert3_op_net,
      d3(0) => invert4_op_net,
      y(0) => all_0s_y_net
    );

  all_1s: entity work.logical_182ac6c51e
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      d0(0) => slice1_y_net,
      d1(0) => slice2_y_net,
      d2(0) => slice3_y_net,
      d3(0) => slice4_y_net,
      y(0) => all_1s_y_net
    );

  and_x0: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => all_0s_y_net,
      d1(0) => all_1s_y_net,
      y(0) => and_y_net_x0
    );

  convert_63ee1a903a: entity work.convert_entity_63ee1a903a
    port map (
      ce_1 => ce_1_sg_x308,
      clk_1 => clk_1_sg_x308,
      in_x0 => mux0_y_net_x1,
      out_x0 => adder_s_net_x1
    );

  invert1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      ip(0) => slice1_y_net,
      op(0) => invert1_op_net
    );

  invert2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      ip(0) => slice2_y_net,
      op(0) => invert2_op_net
    );

  invert3: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      ip(0) => slice3_y_net,
      op(0) => invert3_op_net
    );

  invert4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      ip(0) => slice4_y_net,
      op(0) => invert4_op_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 23,
      new_msb => 23,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x1,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 22,
      new_msb => 22,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x1,
      y(0) => slice2_y_net
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 21,
      new_msb => 21,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x1,
      y(0) => slice3_y_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 20,
      new_msb => 20,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux0_y_net_x1,
      y(0) => slice4_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct/twiddle_general_4mult/c_to_ri2"

entity c_to_ri2_entity_1b263f58f3 is
  port (
    c: in std_logic_vector(35 downto 0); 
    im: out std_logic_vector(17 downto 0); 
    re: out std_logic_vector(17 downto 0)
  );
end c_to_ri2_entity_1b263f58f3;

architecture structural of c_to_ri2_entity_1b263f58f3 is
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal slice_im_y_net: std_logic_vector(17 downto 0);
  signal slice_re_y_net: std_logic_vector(17 downto 0);

begin
  concat_y_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => concat_y_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => concat_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct/twiddle_general_4mult/coeff_gen/ri_to_c"

entity ri_to_c_entity_e0ce0d3fe1 is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c_entity_e0ce0d3fe1;

architecture structural of ri_to_c_entity_e0ce0d3fe1 is
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net: std_logic_vector(17 downto 0);
  signal force_re_output_port_net: std_logic_vector(17 downto 0);
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);

begin
  rom1_data_net_x0 <= im;
  rom_data_net_x0 <= re;
  c <= concat_y_net_x1;

  concat: entity work.concat_b198bd62b0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x1
    );

  force_im: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom_data_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct/twiddle_general_4mult/coeff_gen"

entity coeff_gen_entity_f31992d2df is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_f31992d2df;

architecture structural of coeff_gen_entity_f31992d2df is
  signal ce_1_sg_x315: std_logic;
  signal clk_1_sg_x315: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(1 downto 0);

begin
  ce_1_sg_x315 <= ce_1;
  clk_1_sg_x315 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_fb8caae5ebc5d253",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_e0ce0d3fe1: entity work.ri_to_c_entity_e0ce0d3fe1
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_43_53f87b14ea26f2c9",
      latency => 2
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      en => "1",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_43_2ed32a2fd073c158",
      latency => 2
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      en => "1",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 1,
      x_width => 2,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct/twiddle_general_4mult"

entity twiddle_general_4mult_entity_d9405787f7 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_general_4mult_entity_d9405787f7;

architecture structural of twiddle_general_4mult_entity_d9405787f7 is
  signal addsub1_s_net: std_logic_vector(36 downto 0);
  signal addsub_s_net: std_logic_vector(36 downto 0);
  signal ce_1_sg_x316: std_logic;
  signal clk_1_sg_x316: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay0_q_net_x0: std_logic_vector(35 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult2_p_net: std_logic_vector(35 downto 0);
  signal mult3_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;

begin
  delay_slr_q_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x316 <= ce_1;
  clk_1_sg_x316 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= convert1_dout_net_x0;
  bw_re <= convert0_dout_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_5dcf4c4931
    port map (
      a => mult_p_net,
      b => mult2_p_net,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_15fd84f3fd
    port map (
      a => mult1_p_net,
      b => mult3_p_net,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      s => addsub1_s_net
    );

  c_to_ri1_47b79003c8: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay0_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_1b263f58f3: entity work.c_to_ri2_entity_1b263f58f3
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_82a1e17348: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_f31992d2df: entity work.coeff_gen_entity_f31992d2df
    port map (
      ce_1 => ce_1_sg_x316,
      clk_1 => clk_1_sg_x316,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert0: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      din => addsub_s_net,
      dout => convert0_dout_net_x0
    );

  convert1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      din => addsub1_s_net,
      dout => convert1_dout_net_x0
    );

  delay0: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      d => delay_slr_q_net_x0,
      en => '1',
      q => delay0_q_net_x0
    );

  delay1: entity work.delay_38898c80c0
    port map (
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      d => mux_y_net_x1,
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  mult: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      p => mult_p_net
    );

  mult1: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      p => mult1_p_net
    );

  mult2: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      p => mult2_p_net
    );

  mult3: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      p => mult3_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/butterfly_direct"

entity butterfly_direct_entity_e61255f221 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    of_x0: out std_logic; 
    sync_out: out std_logic
  );
end butterfly_direct_entity_e61255f221;

architecture structural of butterfly_direct_entity_e61255f221 is
  signal adder_s_net_x3: std_logic_vector(17 downto 0);
  signal adder_s_net_x4: std_logic_vector(17 downto 0);
  signal adder_s_net_x5: std_logic_vector(17 downto 0);
  signal adder_s_net_x6: std_logic_vector(17 downto 0);
  signal addsub0_s_net: std_logic_vector(22 downto 0);
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal and_y_net_x0: std_logic;
  signal and_y_net_x1: std_logic;
  signal and_y_net_x2: std_logic;
  signal and_y_net_x3: std_logic;
  signal ce_1_sg_x317: std_logic;
  signal clk_1_sg_x317: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x12: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay_slr_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal logical_y_net_x0: std_logic;
  signal mux0_y_net_x1: std_logic_vector(23 downto 0);
  signal mux1_y_net_x1: std_logic_vector(23 downto 0);
  signal mux2_y_net_x1: std_logic_vector(23 downto 0);
  signal mux3_y_net_x1: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale0_op_net: std_logic_vector(22 downto 0);
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal shift_delay_q_net: std_logic;
  signal slice_y_net_x0: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  delay_slr_q_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x317 <= ce_1;
  clk_1_sg_x317 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x11;
  a_bw_x0 <= concat_y_net_x12;
  of_x0 <= logical_y_net_x0;
  sync_out <= sync_delay_q_net_x3;

  addsub0: entity work.addsub_c8e684a31e
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => addsub0_s_net
    );

  addsub1: entity work.addsub_c8e684a31e
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_26c9c7261b
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_26c9c7261b
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of0_ac01265455: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x317,
      clk_1 => clk_1_sg_x317,
      din => mux0_y_net_x1,
      dout => adder_s_net_x3,
      of_x0 => and_y_net_x0
    );

  convert_of1_9bf32810b4: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x317,
      clk_1 => clk_1_sg_x317,
      din => mux1_y_net_x1,
      dout => adder_s_net_x4,
      of_x0 => and_y_net_x1
    );

  convert_of2_e12016672b: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x317,
      clk_1 => clk_1_sg_x317,
      din => mux2_y_net_x1,
      dout => adder_s_net_x5,
      of_x0 => and_y_net_x2
    );

  convert_of3_269e8ca44b: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x317,
      clk_1 => clk_1_sg_x317,
      din => mux3_y_net_x1,
      dout => adder_s_net_x6,
      of_x0 => and_y_net_x3
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => and_y_net_x0,
      d1(0) => and_y_net_x1,
      d2(0) => and_y_net_x2,
      d3(0) => and_y_net_x3,
      y(0) => logical_y_net_x0
    );

  mux0: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      d0 => addsub0_s_net,
      d1 => scale0_op_net,
      sel(0) => shift_delay_q_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => shift_delay_q_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => shift_delay_q_net,
      y => mux2_y_net_x1
    );

  mux3: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => shift_delay_q_net,
      y => mux3_y_net_x1
    );

  ri_to_c01_0a43bfe06e: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x4,
      re => adder_s_net_x3,
      c => concat_y_net_x11
    );

  ri_to_c23_e540652bab: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x6,
      re => adder_s_net_x5,
      c => concat_y_net_x12
    );

  scale0: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub0_s_net,
      op => scale0_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  shift_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => shift_delay_q_net
    );

  sync_delay: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      d(0) => delay2_q_net_x0,
      q(0) => sync_delay_q_net_x3
    );

  twiddle_general_4mult_d9405787f7: entity work.twiddle_general_4mult_entity_d9405787f7
    port map (
      a => delay_slr_q_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x317,
      clk_1 => clk_1_sg_x317,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => convert1_dout_net_x0,
      bw_re => convert0_dout_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/delay_b"

entity delay_b_entity_7eca6c0f6b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_7eca6c0f6b;

architecture structural of delay_b_entity_7eca6c0f6b is
  signal ce_1_sg_x318: std_logic;
  signal clk_1_sg_x318: std_logic;
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x318 <= ce_1;
  clk_1_sg_x318 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= delay_slr_q_net_x2;

  delay_slr: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      d => mux1_y_net_x0,
      en => '1',
      q => delay_slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3/sync_delay"

entity sync_delay_entity_bc23a979bb is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_bc23a979bb;

architecture structural of sync_delay_entity_bc23a979bb is
  signal ce_1_sg_x320: std_logic;
  signal clk_1_sg_x320: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant2_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x320 <= ce_1;
  clk_1_sg_x320 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_9b3867ea8e1e20fc",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_5f1eb17108
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_f9928864ea
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core/fft_stage_3"

entity fft_stage_3_entity_28f0e5c56a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    of_in: in std_logic; 
    shift: in std_logic_vector(12 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_3_entity_28f0e5c56a;

architecture structural of fft_stage_3_entity_28f0e5c56a is
  signal ce_1_sg_x321: std_logic;
  signal clk_1_sg_x321: std_logic;
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x15: std_logic_vector(35 downto 0);
  signal concat_y_net_x16: std_logic_vector(35 downto 0);
  signal concat_y_net_x17: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical1_y_net_x3: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal slice1_y_net: std_logic;
  signal slice6_y_net_x2: std_logic_vector(12 downto 0);
  signal slice_y_net_x0: std_logic;
  signal sync_delay_q_net_x5: std_logic;
  signal sync_delay_q_net_x6: std_logic;

begin
  ce_1_sg_x321 <= ce_1;
  clk_1_sg_x321 <= clk_1;
  concat_y_net_x14 <= in1;
  concat_y_net_x15 <= in2;
  logical1_y_net_x3 <= of_in;
  slice6_y_net_x2 <= shift;
  sync_delay_q_net_x5 <= sync;
  of_x0 <= logical1_y_net_x0;
  out1 <= concat_y_net_x16;
  out2 <= concat_y_net_x17;
  sync_out <= sync_delay_q_net_x6;

  butterfly_direct_e61255f221: entity work.butterfly_direct_entity_e61255f221
    port map (
      a => delay_slr_q_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x16,
      a_bw_x0 => concat_y_net_x17,
      of_x0 => logical_y_net_x0,
      sync_out => sync_delay_q_net_x6
    );

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      rst(0) => sync_delay_q_net_x5,
      op(0) => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      d(0) => sync_delay_q_net_x5,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_7eca6c0f6b: entity work.delay_b_entity_7eca6c0f6b
    port map (
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      in1 => mux1_y_net_x0,
      out1 => delay_slr_q_net_x2
    );

  delay_f_f24dd6debb: entity work.delay_b_entity_7eca6c0f6b
    port map (
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      in1 => concat_y_net_x15,
      out1 => delay_slr_q_net_x0
    );

  logical1: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => logical1_y_net_x3,
      y(0) => logical1_y_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      d0 => delay_slr_q_net_x0,
      d1 => concat_y_net_x14,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      d0 => concat_y_net_x14,
      d1 => delay_slr_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 13,
      y_width => 1
    )
    port map (
      x => slice6_y_net_x2,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 1,
      y_width => 1
    )
    port map (
      x(0) => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_bc23a979bb: entity work.sync_delay_entity_bc23a979bb
    port map (
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0/biplex_core"

entity biplex_core_entity_04a5887b7c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol1: in std_logic_vector(35 downto 0); 
    pol2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(12 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end biplex_core_entity_04a5887b7c;

architecture structural of biplex_core_entity_04a5887b7c is
  signal ce_1_sg_x322: std_logic;
  signal clk_1_sg_x322: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x15: std_logic_vector(35 downto 0);
  signal concat_y_net_x18: std_logic_vector(35 downto 0);
  signal concat_y_net_x19: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal constant_op_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical1_y_net_x3: std_logic;
  signal logical1_y_net_x4: std_logic;
  signal slice6_y_net_x3: std_logic_vector(12 downto 0);
  signal sync_delay_q_net_x2: std_logic;
  signal sync_delay_q_net_x5: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x322 <= ce_1;
  clk_1_sg_x322 <= clk_1;
  concat_y_net_x10 <= pol1;
  concat_y_net_x6 <= pol2;
  slice6_y_net_x3 <= shift;
  delay_q_net_x3 <= sync;
  of_x0 <= logical1_y_net_x4;
  out1 <= concat_y_net_x18;
  out2 <= concat_y_net_x19;
  sync_out <= sync_delay_q_net_x7;

  constant_x0: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net_x0
    );

  fft_stage_1_c4b4a9bbba: entity work.fft_stage_1_entity_c4b4a9bbba
    port map (
      ce_1 => ce_1_sg_x322,
      clk_1 => clk_1_sg_x322,
      in1 => concat_y_net_x10,
      in2 => concat_y_net_x6,
      of_in => constant_op_net_x0,
      shift => slice6_y_net_x3,
      sync => delay_q_net_x3,
      of_x0 => logical1_y_net_x1,
      out1 => concat_y_net_x7,
      out2 => concat_y_net_x9,
      sync_out => sync_delay_q_net_x2
    );

  fft_stage_2_40dcc1950c: entity work.fft_stage_2_entity_40dcc1950c
    port map (
      ce_1 => ce_1_sg_x322,
      clk_1 => clk_1_sg_x322,
      in1 => concat_y_net_x7,
      in2 => concat_y_net_x9,
      of_in => logical1_y_net_x1,
      shift => slice6_y_net_x3,
      sync => sync_delay_q_net_x2,
      of_x0 => logical1_y_net_x3,
      out1 => concat_y_net_x14,
      out2 => concat_y_net_x15,
      sync_out => sync_delay_q_net_x5
    );

  fft_stage_3_28f0e5c56a: entity work.fft_stage_3_entity_28f0e5c56a
    port map (
      ce_1 => ce_1_sg_x322,
      clk_1 => clk_1_sg_x322,
      in1 => concat_y_net_x14,
      in2 => concat_y_net_x15,
      of_in => logical1_y_net_x3,
      shift => slice6_y_net_x3,
      sync => sync_delay_q_net_x5,
      of_x0 => logical1_y_net_x4,
      out1 => concat_y_net_x18,
      out2 => concat_y_net_x19,
      sync_out => sync_delay_q_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_biplex_real_4x0"

entity fft_biplex_real_4x0_entity_478ec5bf20 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol1: in std_logic_vector(17 downto 0); 
    pol2: in std_logic_vector(17 downto 0); 
    pol3: in std_logic_vector(17 downto 0); 
    pol4: in std_logic_vector(17 downto 0); 
    shift: in std_logic_vector(12 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    pol1_out: out std_logic_vector(35 downto 0); 
    pol2_out: out std_logic_vector(35 downto 0); 
    pol3_out: out std_logic_vector(35 downto 0); 
    pol4_out: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_biplex_real_4x0_entity_478ec5bf20;

architecture structural of fft_biplex_real_4x0_entity_478ec5bf20 is
  signal ce_1_sg_x323: std_logic;
  signal clk_1_sg_x323: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x18: std_logic_vector(35 downto 0);
  signal concat_y_net_x19: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal delay2_q_net_x2: std_logic;
  signal delay_q_net_x4: std_logic;
  signal logical1_y_net_x5: std_logic;
  signal mux1_y_net_x3: std_logic_vector(35 downto 0);
  signal mux2_y_net_x3: std_logic_vector(35 downto 0);
  signal mux3_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic_vector(35 downto 0);
  signal shift1_op_net_x2: std_logic_vector(17 downto 0);
  signal shift2_op_net_x2: std_logic_vector(17 downto 0);
  signal shift3_op_net_x2: std_logic_vector(17 downto 0);
  signal shift4_op_net_x2: std_logic_vector(17 downto 0);
  signal slice6_y_net_x4: std_logic_vector(12 downto 0);
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x323 <= ce_1;
  clk_1_sg_x323 <= clk_1;
  shift3_op_net_x2 <= pol1;
  shift1_op_net_x2 <= pol2;
  shift2_op_net_x2 <= pol3;
  shift4_op_net_x2 <= pol4;
  slice6_y_net_x4 <= shift;
  delay_q_net_x4 <= sync;
  of_x0 <= logical1_y_net_x5;
  pol1_out <= mux_y_net_x2;
  pol2_out <= mux1_y_net_x3;
  pol3_out <= mux2_y_net_x3;
  pol4_out <= mux3_y_net_x3;
  sync_out <= delay2_q_net_x2;

  bi_real_unscr_4x_9eb588e8ec: entity work.bi_real_unscr_4x_entity_9eb588e8ec
    port map (
      ce_1 => ce_1_sg_x323,
      clk_1 => clk_1_sg_x323,
      even => concat_y_net_x18,
      odd => concat_y_net_x19,
      sync => sync_delay_q_net_x7,
      pol1_out => mux_y_net_x2,
      pol2_out => mux1_y_net_x3,
      pol3_out => mux2_y_net_x3,
      pol4_out => mux3_y_net_x3,
      sync_out => delay2_q_net_x2
    );

  biplex_core_04a5887b7c: entity work.biplex_core_entity_04a5887b7c
    port map (
      ce_1 => ce_1_sg_x323,
      clk_1 => clk_1_sg_x323,
      pol1 => concat_y_net_x11,
      pol2 => concat_y_net_x7,
      shift => slice6_y_net_x4,
      sync => delay_q_net_x4,
      of_x0 => logical1_y_net_x5,
      out1 => concat_y_net_x18,
      out2 => concat_y_net_x19,
      sync_out => sync_delay_q_net_x7
    );

  ri_to_c0_c6e5fa4f0f: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => shift1_op_net_x2,
      re => shift3_op_net_x2,
      c => concat_y_net_x11
    );

  ri_to_c1_e8e2e43bab: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => shift4_op_net_x2,
      re => shift2_op_net_x2,
      c => concat_y_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly1_0/twiddle_general_4mult/coeff_gen"

entity coeff_gen_entity_cf8e08ecc9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_cf8e08ecc9;

architecture structural of coeff_gen_entity_cf8e08ecc9 is
  signal ce_1_sg_x332: std_logic;
  signal clk_1_sg_x332: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay2_q_net_x3: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(2 downto 0);

begin
  ce_1_sg_x332 <= ce_1;
  clk_1_sg_x332 <= clk_1;
  delay2_q_net_x3 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x332,
      clk => clk_1_sg_x332,
      clr => '0',
      en => "1",
      rst(0) => delay2_q_net_x3,
      op => counter_op_net
    );

  ri_to_c_a76a51c452: entity work.ri_to_c_entity_e0ce0d3fe1
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "bmg_33_0f271527e63322ae",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x332,
      clk => clk_1_sg_x332,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "bmg_33_8885c1eef0f229b0",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x332,
      clk => clk_1_sg_x332,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 2,
      x_width => 3,
      y_width => 3
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly1_0/twiddle_general_4mult"

entity twiddle_general_4mult_entity_2b806e0640 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_general_4mult_entity_2b806e0640;

architecture structural of twiddle_general_4mult_entity_2b806e0640 is
  signal addsub1_s_net: std_logic_vector(36 downto 0);
  signal addsub_s_net: std_logic_vector(36 downto 0);
  signal ce_1_sg_x333: std_logic;
  signal clk_1_sg_x333: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay0_q_net_x0: std_logic_vector(35 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay2_q_net_x4: std_logic;
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult2_p_net: std_logic_vector(35 downto 0);
  signal mult3_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal node0_0_q_net_x0: std_logic_vector(35 downto 0);
  signal node0_2_q_net_x0: std_logic_vector(35 downto 0);

begin
  node0_0_q_net_x0 <= a;
  node0_2_q_net_x0 <= b;
  ce_1_sg_x333 <= ce_1;
  clk_1_sg_x333 <= clk_1;
  delay2_q_net_x4 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= convert1_dout_net_x0;
  bw_re <= convert0_dout_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_5dcf4c4931
    port map (
      a => mult_p_net,
      b => mult2_p_net,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_15fd84f3fd
    port map (
      a => mult1_p_net,
      b => mult3_p_net,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      s => addsub1_s_net
    );

  c_to_ri1_c4fe546c89: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay0_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_def6c8e2f1: entity work.c_to_ri2_entity_1b263f58f3
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_d6ab077a08: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_cf8e08ecc9: entity work.coeff_gen_entity_cf8e08ecc9
    port map (
      ce_1 => ce_1_sg_x333,
      clk_1 => clk_1_sg_x333,
      rst => delay2_q_net_x4,
      w => concat_y_net_x2
    );

  convert0: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      din => addsub_s_net,
      dout => convert0_dout_net_x0
    );

  convert1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      din => addsub1_s_net,
      dout => convert1_dout_net_x0
    );

  delay0: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      d => node0_0_q_net_x0,
      en => '1',
      q => delay0_q_net_x0
    );

  delay1: entity work.delay_38898c80c0
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      d => node0_2_q_net_x0,
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      d(0) => delay2_q_net_x4,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  mult: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      p => mult_p_net
    );

  mult1: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      p => mult1_p_net
    );

  mult2: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      p => mult2_p_net
    );

  mult3: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      p => mult3_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly1_0"

entity butterfly1_0_entity_5438920360 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    of_x0: out std_logic; 
    sync_out: out std_logic
  );
end butterfly1_0_entity_5438920360;

architecture structural of butterfly1_0_entity_5438920360 is
  signal adder_s_net_x3: std_logic_vector(17 downto 0);
  signal adder_s_net_x4: std_logic_vector(17 downto 0);
  signal adder_s_net_x5: std_logic_vector(17 downto 0);
  signal adder_s_net_x6: std_logic_vector(17 downto 0);
  signal addsub0_s_net: std_logic_vector(22 downto 0);
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal and_y_net_x0: std_logic;
  signal and_y_net_x1: std_logic;
  signal and_y_net_x2: std_logic;
  signal and_y_net_x3: std_logic;
  signal ce_1_sg_x334: std_logic;
  signal clk_1_sg_x334: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay2_q_net_x5: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal logical_y_net_x0: std_logic;
  signal mux0_y_net_x1: std_logic_vector(23 downto 0);
  signal mux1_y_net_x1: std_logic_vector(23 downto 0);
  signal mux2_y_net_x1: std_logic_vector(23 downto 0);
  signal mux3_y_net_x1: std_logic_vector(23 downto 0);
  signal node0_0_q_net_x1: std_logic_vector(35 downto 0);
  signal node0_2_q_net_x1: std_logic_vector(35 downto 0);
  signal scale0_op_net: std_logic_vector(22 downto 0);
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal shift_delay_q_net: std_logic;
  signal slice0_y_net_x0: std_logic;
  signal sync_delay_q_net_x0: std_logic;

begin
  node0_0_q_net_x1 <= a;
  node0_2_q_net_x1 <= b;
  ce_1_sg_x334 <= ce_1;
  clk_1_sg_x334 <= clk_1;
  slice0_y_net_x0 <= shift;
  delay2_q_net_x5 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  of_x0 <= logical_y_net_x0;
  sync_out <= sync_delay_q_net_x0;

  addsub0: entity work.addsub_c8e684a31e
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      s => addsub0_s_net
    );

  addsub1: entity work.addsub_c8e684a31e
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_26c9c7261b
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_26c9c7261b
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of0_5c0b1be478: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x334,
      clk_1 => clk_1_sg_x334,
      din => mux0_y_net_x1,
      dout => adder_s_net_x3,
      of_x0 => and_y_net_x0
    );

  convert_of1_fc53f852ac: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x334,
      clk_1 => clk_1_sg_x334,
      din => mux1_y_net_x1,
      dout => adder_s_net_x4,
      of_x0 => and_y_net_x1
    );

  convert_of2_bed5b474b1: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x334,
      clk_1 => clk_1_sg_x334,
      din => mux2_y_net_x1,
      dout => adder_s_net_x5,
      of_x0 => and_y_net_x2
    );

  convert_of3_e7dcb314cd: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x334,
      clk_1 => clk_1_sg_x334,
      din => mux3_y_net_x1,
      dout => adder_s_net_x6,
      of_x0 => and_y_net_x3
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => and_y_net_x0,
      d1(0) => and_y_net_x1,
      d2(0) => and_y_net_x2,
      d3(0) => and_y_net_x3,
      y(0) => logical_y_net_x0
    );

  mux0: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      d0 => addsub0_s_net,
      d1 => scale0_op_net,
      sel(0) => shift_delay_q_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => shift_delay_q_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => shift_delay_q_net,
      y => mux2_y_net_x1
    );

  mux3: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => shift_delay_q_net,
      y => mux3_y_net_x1
    );

  ri_to_c01_ee3265ef05: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x4,
      re => adder_s_net_x3,
      c => concat_y_net_x2
    );

  ri_to_c23_eebb00111a: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x6,
      re => adder_s_net_x5,
      c => concat_y_net_x3
    );

  scale0: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub0_s_net,
      op => scale0_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  shift_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      d(0) => slice0_y_net_x0,
      en => '1',
      q(0) => shift_delay_q_net
    );

  sync_delay: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      clr => '0',
      d(0) => delay2_q_net_x0,
      q(0) => sync_delay_q_net_x0
    );

  twiddle_general_4mult_2b806e0640: entity work.twiddle_general_4mult_entity_2b806e0640
    port map (
      a => node0_0_q_net_x1,
      b => node0_2_q_net_x1,
      ce_1 => ce_1_sg_x334,
      clk_1 => clk_1_sg_x334,
      sync => delay2_q_net_x5,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => convert1_dout_net_x0,
      bw_re => convert0_dout_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_0/convert_of2"

entity convert_of2_entity_57fadc148a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    of_x0: out std_logic
  );
end convert_of2_entity_57fadc148a;

architecture structural of convert_of2_entity_57fadc148a is
  signal all_0s_y_net: std_logic;
  signal all_1s_y_net: std_logic;
  signal and_y_net_x0: std_logic;
  signal ce_1_sg_x350: std_logic;
  signal clk_1_sg_x350: std_logic;
  signal invert1_op_net: std_logic;
  signal invert2_op_net: std_logic;
  signal invert3_op_net: std_logic;
  signal invert4_op_net: std_logic;
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic;
  signal slice3_y_net: std_logic;
  signal slice4_y_net: std_logic;

begin
  ce_1_sg_x350 <= ce_1;
  clk_1_sg_x350 <= clk_1;
  mux2_y_net_x0 <= din;
  of_x0 <= and_y_net_x0;

  all_0s: entity work.logical_182ac6c51e
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d0(0) => invert1_op_net,
      d1(0) => invert2_op_net,
      d2(0) => invert3_op_net,
      d3(0) => invert4_op_net,
      y(0) => all_0s_y_net
    );

  all_1s: entity work.logical_182ac6c51e
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d0(0) => slice1_y_net,
      d1(0) => slice2_y_net,
      d2(0) => slice3_y_net,
      d3(0) => slice4_y_net,
      y(0) => all_1s_y_net
    );

  and_x0: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => all_0s_y_net,
      d1(0) => all_1s_y_net,
      y(0) => and_y_net_x0
    );

  invert1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      ip(0) => slice1_y_net,
      op(0) => invert1_op_net
    );

  invert2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      ip(0) => slice2_y_net,
      op(0) => invert2_op_net
    );

  invert3: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      ip(0) => slice3_y_net,
      op(0) => invert3_op_net
    );

  invert4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      ip(0) => slice4_y_net,
      op(0) => invert4_op_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 23,
      new_msb => 23,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux2_y_net_x0,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 22,
      new_msb => 22,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux2_y_net_x0,
      y(0) => slice2_y_net
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 21,
      new_msb => 21,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux2_y_net_x0,
      y(0) => slice3_y_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 20,
      new_msb => 20,
      x_width => 24,
      y_width => 1
    )
    port map (
      x => mux2_y_net_x0,
      y(0) => slice4_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_0/twiddle_general_4mult/coeff_gen"

entity coeff_gen_entity_067ef19e96 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_067ef19e96;

architecture structural of coeff_gen_entity_067ef19e96 is
  signal ce_1_sg_x352: std_logic;
  signal clk_1_sg_x352: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(2 downto 0);
  signal sync_delay_q_net_x1: std_logic;

begin
  ce_1_sg_x352 <= ce_1;
  clk_1_sg_x352 <= clk_1;
  sync_delay_q_net_x1 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x1,
      op => counter_op_net
    );

  ri_to_c_f4a10fc1ee: entity work.ri_to_c_entity_e0ce0d3fe1
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "bmg_33_634c918d29c53dc7",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "bmg_33_f14ebd1f50b8aa2e",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 2,
      x_width => 3,
      y_width => 3
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_0/twiddle_general_4mult"

entity twiddle_general_4mult_entity_fa6a3575d6 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_general_4mult_entity_fa6a3575d6;

architecture structural of twiddle_general_4mult_entity_fa6a3575d6 is
  signal addsub1_s_net: std_logic_vector(36 downto 0);
  signal addsub_s_net: std_logic_vector(36 downto 0);
  signal ce_1_sg_x353: std_logic;
  signal clk_1_sg_x353: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay0_q_net_x0: std_logic_vector(35 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult2_p_net: std_logic_vector(35 downto 0);
  signal mult3_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal node1_0_q_net_x0: std_logic_vector(35 downto 0);
  signal node1_1_q_net_x0: std_logic_vector(35 downto 0);
  signal sync_delay_q_net_x2: std_logic;

begin
  node1_0_q_net_x0 <= a;
  node1_1_q_net_x0 <= b;
  ce_1_sg_x353 <= ce_1;
  clk_1_sg_x353 <= clk_1;
  sync_delay_q_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= convert1_dout_net_x0;
  bw_re <= convert0_dout_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_5dcf4c4931
    port map (
      a => mult_p_net,
      b => mult2_p_net,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_15fd84f3fd
    port map (
      a => mult1_p_net,
      b => mult3_p_net,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      s => addsub1_s_net
    );

  c_to_ri1_8275e5e0d5: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay0_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_4eb69339bc: entity work.c_to_ri2_entity_1b263f58f3
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_c2817ffb0f: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_067ef19e96: entity work.coeff_gen_entity_067ef19e96
    port map (
      ce_1 => ce_1_sg_x353,
      clk_1 => clk_1_sg_x353,
      rst => sync_delay_q_net_x2,
      w => concat_y_net_x2
    );

  convert0: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      din => addsub_s_net,
      dout => convert0_dout_net_x0
    );

  convert1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      din => addsub1_s_net,
      dout => convert1_dout_net_x0
    );

  delay0: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      d => node1_0_q_net_x0,
      en => '1',
      q => delay0_q_net_x0
    );

  delay1: entity work.delay_38898c80c0
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      d => node1_1_q_net_x0,
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      d(0) => sync_delay_q_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  mult: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      p => mult_p_net
    );

  mult1: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      p => mult1_p_net
    );

  mult2: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      p => mult2_p_net
    );

  mult3: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      p => mult3_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_0"

entity butterfly2_0_entity_99b13199ed is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    of_x0: out std_logic; 
    sync_out: out std_logic
  );
end butterfly2_0_entity_99b13199ed;

architecture structural of butterfly2_0_entity_99b13199ed is
  signal adder_s_net_x3: std_logic_vector(17 downto 0);
  signal adder_s_net_x4: std_logic_vector(17 downto 0);
  signal addsub0_s_net: std_logic_vector(22 downto 0);
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal and_y_net_x0: std_logic;
  signal and_y_net_x1: std_logic;
  signal and_y_net_x2: std_logic;
  signal and_y_net_x3: std_logic;
  signal ce_1_sg_x354: std_logic;
  signal clk_1_sg_x354: std_logic;
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal logical_y_net_x0: std_logic;
  signal mux0_y_net_x1: std_logic_vector(23 downto 0);
  signal mux1_y_net_x1: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal node1_0_q_net_x1: std_logic_vector(35 downto 0);
  signal node1_1_q_net_x1: std_logic_vector(35 downto 0);
  signal scale0_op_net: std_logic_vector(22 downto 0);
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal shift_delay_q_net: std_logic;
  signal slice1_y_net_x0: std_logic;
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  node1_0_q_net_x1 <= a;
  node1_1_q_net_x1 <= b;
  ce_1_sg_x354 <= ce_1;
  clk_1_sg_x354 <= clk_1;
  slice1_y_net_x0 <= shift;
  sync_delay_q_net_x3 <= sync;
  a_bw <= concat_y_net_x1;
  of_x0 <= logical_y_net_x0;
  sync_out <= sync_delay_q_net_x0;

  addsub0: entity work.addsub_c8e684a31e
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      s => addsub0_s_net
    );

  addsub1: entity work.addsub_c8e684a31e
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_26c9c7261b
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_26c9c7261b
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of0_2044e7df3c: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      din => mux0_y_net_x1,
      dout => adder_s_net_x3,
      of_x0 => and_y_net_x0
    );

  convert_of1_087315f355: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      din => mux1_y_net_x1,
      dout => adder_s_net_x4,
      of_x0 => and_y_net_x1
    );

  convert_of2_57fadc148a: entity work.convert_of2_entity_57fadc148a
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      din => mux2_y_net_x0,
      of_x0 => and_y_net_x2
    );

  convert_of3_2439813526: entity work.convert_of2_entity_57fadc148a
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      din => mux3_y_net_x0,
      of_x0 => and_y_net_x3
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => and_y_net_x0,
      d1(0) => and_y_net_x1,
      d2(0) => and_y_net_x2,
      d3(0) => and_y_net_x3,
      y(0) => logical_y_net_x0
    );

  mux0: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      d0 => addsub0_s_net,
      d1 => scale0_op_net,
      sel(0) => shift_delay_q_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => shift_delay_q_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => shift_delay_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => shift_delay_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c01_8cd3943aa8: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x4,
      re => adder_s_net_x3,
      c => concat_y_net_x1
    );

  scale0: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub0_s_net,
      op => scale0_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  shift_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d(0) => slice1_y_net_x0,
      en => '1',
      q(0) => shift_delay_q_net
    );

  sync_delay: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      d(0) => delay2_q_net_x0,
      q(0) => sync_delay_q_net_x0
    );

  twiddle_general_4mult_fa6a3575d6: entity work.twiddle_general_4mult_entity_fa6a3575d6
    port map (
      a => node1_0_q_net_x1,
      b => node1_1_q_net_x1,
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      sync => sync_delay_q_net_x3,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => convert1_dout_net_x0,
      bw_re => convert0_dout_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_1/twiddle_general_4mult/coeff_gen"

entity coeff_gen_entity_5bbeda84b9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_5bbeda84b9;

architecture structural of coeff_gen_entity_5bbeda84b9 is
  signal ce_1_sg_x361: std_logic;
  signal clk_1_sg_x361: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(2 downto 0);
  signal sync_delay_q_net_x1: std_logic;

begin
  ce_1_sg_x361 <= ce_1;
  clk_1_sg_x361 <= clk_1;
  sync_delay_q_net_x1 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_4766397a2cb82e6c",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x1,
      op => counter_op_net
    );

  ri_to_c_66afc54b96: entity work.ri_to_c_entity_e0ce0d3fe1
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "bmg_33_f14ebd1f50b8aa2e",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "bmg_33_e339bf6bf27d230b",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 2,
      x_width => 3,
      y_width => 3
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_1/twiddle_general_4mult"

entity twiddle_general_4mult_entity_899bde9351 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0)
  );
end twiddle_general_4mult_entity_899bde9351;

architecture structural of twiddle_general_4mult_entity_899bde9351 is
  signal addsub1_s_net: std_logic_vector(36 downto 0);
  signal addsub_s_net: std_logic_vector(36 downto 0);
  signal ce_1_sg_x362: std_logic;
  signal clk_1_sg_x362: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal delay0_q_net_x0: std_logic_vector(35 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult2_p_net: std_logic_vector(35 downto 0);
  signal mult3_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal node1_2_q_net_x0: std_logic_vector(35 downto 0);
  signal node1_3_q_net_x0: std_logic_vector(35 downto 0);
  signal sync_delay_q_net_x2: std_logic;

begin
  node1_2_q_net_x0 <= a;
  node1_3_q_net_x0 <= b;
  ce_1_sg_x362 <= ce_1;
  clk_1_sg_x362 <= clk_1;
  sync_delay_q_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= convert1_dout_net_x0;
  bw_re <= convert0_dout_net_x0;

  addsub: entity work.addsub_5dcf4c4931
    port map (
      a => mult_p_net,
      b => mult2_p_net,
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_15fd84f3fd
    port map (
      a => mult1_p_net,
      b => mult3_p_net,
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      s => addsub1_s_net
    );

  c_to_ri1_1c80868287: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay0_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_415ff7caf9: entity work.c_to_ri2_entity_1b263f58f3
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_06a942b675: entity work.c_to_ri_entity_6df0a21fa1
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_5bbeda84b9: entity work.coeff_gen_entity_5bbeda84b9
    port map (
      ce_1 => ce_1_sg_x362,
      clk_1 => clk_1_sg_x362,
      rst => sync_delay_q_net_x2,
      w => concat_y_net_x2
    );

  convert0: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      din => addsub_s_net,
      dout => convert0_dout_net_x0
    );

  convert1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 37,
      dout_arith => 2,
      dout_bin_pt => 19,
      dout_width => 22,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      din => addsub1_s_net,
      dout => convert1_dout_net_x0
    );

  delay0: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      d => node1_2_q_net_x0,
      en => '1',
      q => delay0_q_net_x0
    );

  delay1: entity work.delay_38898c80c0
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      d => node1_3_q_net_x0,
      q => delay1_q_net_x0
    );

  mult: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      p => mult_p_net
    );

  mult1: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      p => mult1_p_net
    );

  mult2: entity work.mult_f295e5f0f2
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      p => mult2_p_net
    );

  mult3: entity work.mult_f295e5f0f2
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      p => mult3_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct/butterfly2_1"

entity butterfly2_1_entity_5205a93e8a is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    of_x0: out std_logic
  );
end butterfly2_1_entity_5205a93e8a;

architecture structural of butterfly2_1_entity_5205a93e8a is
  signal adder_s_net_x3: std_logic_vector(17 downto 0);
  signal adder_s_net_x4: std_logic_vector(17 downto 0);
  signal addsub0_s_net: std_logic_vector(22 downto 0);
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal and_y_net_x0: std_logic;
  signal and_y_net_x1: std_logic;
  signal and_y_net_x2: std_logic;
  signal and_y_net_x3: std_logic;
  signal ce_1_sg_x363: std_logic;
  signal clk_1_sg_x363: std_logic;
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal convert0_dout_net_x0: std_logic_vector(21 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal logical_y_net_x0: std_logic;
  signal mux0_y_net_x1: std_logic_vector(23 downto 0);
  signal mux1_y_net_x1: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal node1_2_q_net_x1: std_logic_vector(35 downto 0);
  signal node1_3_q_net_x1: std_logic_vector(35 downto 0);
  signal scale0_op_net: std_logic_vector(22 downto 0);
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal shift_delay_q_net: std_logic;
  signal slice1_y_net_x1: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  node1_2_q_net_x1 <= a;
  node1_3_q_net_x1 <= b;
  ce_1_sg_x363 <= ce_1;
  clk_1_sg_x363 <= clk_1;
  slice1_y_net_x1 <= shift;
  sync_delay_q_net_x3 <= sync;
  a_bw <= concat_y_net_x1;
  of_x0 <= logical_y_net_x0;

  addsub0: entity work.addsub_c8e684a31e
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      s => addsub0_s_net
    );

  addsub1: entity work.addsub_c8e684a31e
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_26c9c7261b
    port map (
      a => force_re_output_port_net_x3,
      b => convert0_dout_net_x0,
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_26c9c7261b
    port map (
      a => force_im_output_port_net_x3,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of0_14d59c57df: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      din => mux0_y_net_x1,
      dout => adder_s_net_x3,
      of_x0 => and_y_net_x0
    );

  convert_of1_aa625f960a: entity work.convert_of0_entity_ac01265455
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      din => mux1_y_net_x1,
      dout => adder_s_net_x4,
      of_x0 => and_y_net_x1
    );

  convert_of2_5e7a47fa0f: entity work.convert_of2_entity_57fadc148a
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      din => mux2_y_net_x0,
      of_x0 => and_y_net_x2
    );

  convert_of3_4fe6f81ea8: entity work.convert_of2_entity_57fadc148a
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      din => mux3_y_net_x0,
      of_x0 => and_y_net_x3
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => and_y_net_x0,
      d1(0) => and_y_net_x1,
      d2(0) => and_y_net_x2,
      d3(0) => and_y_net_x3,
      y(0) => logical_y_net_x0
    );

  mux0: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      d0 => addsub0_s_net,
      d1 => scale0_op_net,
      sel(0) => shift_delay_q_net,
      y => mux0_y_net_x1
    );

  mux1: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => shift_delay_q_net,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => shift_delay_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_f1f44b96f0
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => shift_delay_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c01_9553181d4f: entity work.ri_to_c_entity_f7870abfd7
    port map (
      im => adder_s_net_x4,
      re => adder_s_net_x3,
      c => concat_y_net_x1
    );

  scale0: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub0_s_net,
      op => scale0_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  shift_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      d(0) => slice1_y_net_x1,
      en => '1',
      q(0) => shift_delay_q_net
    );

  twiddle_general_4mult_899bde9351: entity work.twiddle_general_4mult_entity_899bde9351
    port map (
      a => node1_2_q_net_x1,
      b => node1_3_q_net_x1,
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      sync => sync_delay_q_net_x3,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => convert1_dout_net_x0,
      bw_re => convert0_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_direct"

entity fft_direct_entity_94531946de is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in0: in std_logic_vector(35 downto 0); 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    in3: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(1 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    out0: out std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_direct_entity_94531946de;

architecture structural of fft_direct_entity_94531946de is
  signal ce_1_sg_x364: std_logic;
  signal clk_1_sg_x364: std_logic;
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal delay2_q_net_x9: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x1: std_logic;
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal mux1_y_net_x4: std_logic_vector(35 downto 0);
  signal mux2_y_net_x4: std_logic_vector(35 downto 0);
  signal mux3_y_net_x4: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal node0_0_q_net_x1: std_logic_vector(35 downto 0);
  signal node0_1_q_net_x1: std_logic_vector(35 downto 0);
  signal node0_2_q_net_x1: std_logic_vector(35 downto 0);
  signal node0_3_q_net_x1: std_logic_vector(35 downto 0);
  signal node1_0_q_net_x1: std_logic_vector(35 downto 0);
  signal node1_1_q_net_x1: std_logic_vector(35 downto 0);
  signal node1_2_q_net_x1: std_logic_vector(35 downto 0);
  signal node1_3_q_net_x1: std_logic_vector(35 downto 0);
  signal node2_0_q_net_x0: std_logic_vector(35 downto 0);
  signal node2_2_q_net_x0: std_logic_vector(35 downto 0);
  signal of_1_y_net: std_logic;
  signal of_2_y_net: std_logic;
  signal of_or_y_net_x0: std_logic;
  signal slice0_y_net_x1: std_logic;
  signal slice1_y_net_x1: std_logic;
  signal slice_y_net_x0: std_logic_vector(1 downto 0);
  signal sync_delay_q_net_x3: std_logic;
  signal sync_delay_q_net_x4: std_logic;
  signal sync_delay_q_net_x5: std_logic;

begin
  ce_1_sg_x364 <= ce_1;
  clk_1_sg_x364 <= clk_1;
  mux_y_net_x3 <= in0;
  mux1_y_net_x4 <= in1;
  mux2_y_net_x4 <= in2;
  mux3_y_net_x4 <= in3;
  slice_y_net_x0 <= shift;
  delay2_q_net_x9 <= sync;
  of_x0 <= of_or_y_net_x0;
  out0 <= node2_0_q_net_x0;
  out1 <= node2_2_q_net_x0;
  sync_out <= sync_delay_q_net_x5;

  butterfly1_0_5438920360: entity work.butterfly1_0_entity_5438920360
    port map (
      a => node0_0_q_net_x1,
      b => node0_2_q_net_x1,
      ce_1 => ce_1_sg_x364,
      clk_1 => clk_1_sg_x364,
      shift => slice0_y_net_x1,
      sync => delay2_q_net_x9,
      a_bw => concat_y_net_x2,
      a_bw_x0 => concat_y_net_x3,
      of_x0 => logical_y_net_x0,
      sync_out => sync_delay_q_net_x3
    );

  butterfly1_1_6e4c90fd34: entity work.butterfly1_0_entity_5438920360
    port map (
      a => node0_1_q_net_x1,
      b => node0_3_q_net_x1,
      ce_1 => ce_1_sg_x364,
      clk_1 => clk_1_sg_x364,
      shift => slice0_y_net_x1,
      sync => delay2_q_net_x9,
      a_bw => concat_y_net_x4,
      a_bw_x0 => concat_y_net_x5,
      of_x0 => logical_y_net_x1,
      sync_out => sync_delay_q_net_x4
    );

  butterfly2_0_99b13199ed: entity work.butterfly2_0_entity_99b13199ed
    port map (
      a => node1_0_q_net_x1,
      b => node1_1_q_net_x1,
      ce_1 => ce_1_sg_x364,
      clk_1 => clk_1_sg_x364,
      shift => slice1_y_net_x1,
      sync => sync_delay_q_net_x3,
      a_bw => concat_y_net_x1,
      of_x0 => logical_y_net_x2,
      sync_out => sync_delay_q_net_x5
    );

  butterfly2_1_5205a93e8a: entity work.butterfly2_1_entity_5205a93e8a
    port map (
      a => node1_2_q_net_x1,
      b => node1_3_q_net_x1,
      ce_1 => ce_1_sg_x364,
      clk_1 => clk_1_sg_x364,
      shift => slice1_y_net_x1,
      sync => sync_delay_q_net_x4,
      a_bw => concat_y_net_x6,
      of_x0 => logical_y_net_x3
    );

  node0_0: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => mux_y_net_x3,
      q => node0_0_q_net_x1
    );

  node0_1: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => mux1_y_net_x4,
      q => node0_1_q_net_x1
    );

  node0_2: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => mux2_y_net_x4,
      q => node0_2_q_net_x1
    );

  node0_3: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => mux3_y_net_x4,
      q => node0_3_q_net_x1
    );

  node1_0: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x2,
      q => node1_0_q_net_x1
    );

  node1_1: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x4,
      q => node1_1_q_net_x1
    );

  node1_2: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x3,
      q => node1_2_q_net_x1
    );

  node1_3: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x5,
      q => node1_3_q_net_x1
    );

  node2_0: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x1,
      q => node2_0_q_net_x0
    );

  node2_2: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => concat_y_net_x6,
      q => node2_2_q_net_x0
    );

  of_1: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x364,
      clk => clk_1_sg_x364,
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => logical_y_net_x1,
      y(0) => of_1_y_net
    );

  of_2: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x364,
      clk => clk_1_sg_x364,
      clr => '0',
      d0(0) => logical_y_net_x2,
      d1(0) => logical_y_net_x3,
      y(0) => of_2_y_net
    );

  of_or: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => of_1_y_net,
      d1(0) => of_2_y_net,
      y(0) => of_or_y_net_x0
    );

  slice0: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => slice_y_net_x0,
      y(0) => slice0_y_net_x1
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => slice_y_net_x0,
      y(0) => slice1_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_unscrambler/reorder/sync_delay_en"

entity sync_delay_en_entity_4d6b2b98c0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_en_entity_4d6b2b98c0;

architecture structural of sync_delay_en_entity_4d6b2b98c0 is
  signal ce_1_sg_x365: std_logic;
  signal clk_1_sg_x365: std_logic;
  signal constant1_op_net: std_logic_vector(3 downto 0);
  signal constant2_op_net: std_logic_vector(3 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(3 downto 0);
  signal counter_op_net: std_logic_vector(3 downto 0);
  signal logical1_y_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal or_y_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x365 <= ce_1;
  clk_1_sg_x365 <= clk_1;
  or_y_net_x0 <= en;
  pre_sync_delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_4c449dd556
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_145086465d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_67ad97ca70
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_8ce1eef9b3b41e0a",
      op_arith => xlUnsigned,
      op_width => 4
    )
    port map (
      ce => ce_1_sg_x365,
      clk => clk_1_sg_x365,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical1_y_net,
      load(0) => pre_sync_delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net,
      d1(0) => or_y_net_x0,
      y(0) => logical1_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_4d3cfceaf4
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_d930162434
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_unscrambler/reorder"

entity reorder_entity_36e6f29898 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0); 
    dout1: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end reorder_entity_36e6f29898;

architecture structural of reorder_entity_36e6f29898 is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x0: std_logic_vector(35 downto 0);
  signal ce_1_sg_x366: std_logic;
  signal clk_1_sg_x366: std_logic;
  signal const_op_net_x0: std_logic;
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay0_q_net_x0: std_logic;
  signal delay_d0_q_net: std_logic_vector(2 downto 0);
  signal delay_din0_q_net: std_logic_vector(35 downto 0);
  signal delay_din1_q_net: std_logic_vector(35 downto 0);
  signal delay_map1_q_net: std_logic_vector(2 downto 0);
  signal delay_map2_q_net: std_logic_vector(2 downto 0);
  signal delay_sel_q_net: std_logic_vector(1 downto 0);
  signal delay_we_q_net: std_logic;
  signal delayb1_q_net_x0: std_logic_vector(35 downto 0);
  signal delayb2_q_net_x0: std_logic_vector(35 downto 0);
  signal map1_data_net: std_logic_vector(2 downto 0);
  signal map2_data_net: std_logic_vector(2 downto 0);
  signal mux_y_net: std_logic_vector(2 downto 0);
  signal mux_y_net_x0: std_logic;
  signal or_y_net_x0: std_logic;
  signal post_sync_delay_q_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal slice1_y_net: std_logic_vector(1 downto 0);
  signal slice2_y_net: std_logic_vector(2 downto 0);

begin
  ce_1_sg_x366 <= ce_1;
  clk_1_sg_x366 <= clk_1;
  delayb1_q_net_x0 <= din0;
  delayb2_q_net_x0 <= din1;
  const_op_net_x0 <= en;
  delay0_q_net_x0 <= sync;
  dout0 <= bram0_data_out_net_x0;
  dout1 <= bram1_data_out_net_x0;
  sync_out <= post_sync_delay_q_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 3,
      c_width => 36,
      core_name0 => "bmg_33_3799cc002d427b8c",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x0
    );

  bram1: entity work.xlspram
    generic map (
      c_address_width => 3,
      c_width => 36,
      core_name0 => "bmg_33_3799cc002d427b8c",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      data_in => delay_din1_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram1_data_out_net_x0
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 23,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_78ff46b917fcba28",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 5
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      clr => '0',
      en(0) => const_op_net_x0,
      rst(0) => delay0_q_net_x0,
      op => counter_op_net
    );

  delay_d0: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 3
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d => slice2_y_net,
      en => '1',
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d => delayb1_q_net_x0,
      en => '1',
      q => delay_din0_q_net
    );

  delay_din1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d => delayb2_q_net_x0,
      en => '1',
      q => delay_din1_q_net
    );

  delay_map1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 3
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d => map1_data_net,
      en => '1',
      q => delay_map1_q_net
    );

  delay_map2: entity work.delay_89924b5b6b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map2_data_net,
      q => delay_map2_q_net
    );

  delay_sel: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 2
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d => slice1_y_net,
      en => '1',
      q => delay_sel_q_net
    );

  delay_we: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d(0) => const_op_net_x0,
      en => '1',
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 3,
      c_address_width => 4,
      c_width => 3,
      core_name0 => "dmg_43_6b984b7172c2a487",
      latency => 1
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      en => "1",
      data => map1_data_net
    );

  map2: entity work.xlsprom_dist
    generic map (
      addr_width => 3,
      c_address_width => 4,
      c_width => 3,
      core_name0 => "dmg_43_6b984b7172c2a487",
      latency => 1
    )
    port map (
      addr => map1_data_net,
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      en => "1",
      data => map2_data_net
    );

  mux: entity work.mux_418812c519
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      d2 => delay_map2_q_net,
      sel => delay_sel_q_net,
      y => mux_y_net
    );

  or_x0: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => delay_we_q_net,
      y(0) => or_y_net_x0
    );

  post_sync_delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d(0) => mux_y_net_x0,
      en => '1',
      q(0) => post_sync_delay_q_net_x0
    );

  pre_sync_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d(0) => delay0_q_net_x0,
      en => '1',
      q(0) => pre_sync_delay_q_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 4,
      x_width => 5,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 2,
      x_width => 5,
      y_width => 3
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

  sync_delay_en_4d6b2b98c0: entity work.sync_delay_en_entity_4d6b2b98c0
    port map (
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      en => or_y_net_x0,
      in_x0 => pre_sync_delay_q_net_x0,
      out_x0 => mux_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_unscrambler/square_transposer/barrel_switcher"

entity barrel_switcher_entity_9e05cb67c4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    sel: in std_logic; 
    sync_in: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end barrel_switcher_entity_9e05cb67c4;

architecture structural of barrel_switcher_entity_9e05cb67c4 is
  signal ce_1_sg_x367: std_logic;
  signal clk_1_sg_x367: std_logic;
  signal counter_op_net_x0: std_logic;
  signal delay_sync_q_net_x0: std_logic;
  signal delayf1_q_net_x0: std_logic_vector(35 downto 0);
  signal delayf2_q_net_x0: std_logic_vector(35 downto 0);
  signal mux11_y_net_x0: std_logic_vector(35 downto 0);
  signal mux21_y_net_x0: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal sync_delay_q_net_x6: std_logic;

begin
  ce_1_sg_x367 <= ce_1;
  clk_1_sg_x367 <= clk_1;
  delayf1_q_net_x0 <= in1;
  delayf2_q_net_x0 <= in2;
  counter_op_net_x0 <= sel;
  sync_delay_q_net_x6 <= sync_in;
  out1 <= mux11_y_net_x0;
  out2 <= mux21_y_net_x0;
  sync_out <= delay_sync_q_net_x0;

  delay_sync: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      d(0) => sync_delay_q_net_x6,
      en => '1',
      q(0) => delay_sync_q_net_x0
    );

  mux11: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      d0 => delayf1_q_net_x0,
      d1 => delayf2_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux11_y_net_x0
    );

  mux21: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      d0 => delayf2_q_net_x0,
      d1 => delayf1_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux21_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 1,
      y_width => 1
    )
    port map (
      x(0) => counter_op_net_x0,
      y(0) => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_unscrambler/square_transposer"

entity square_transposer_entity_3154c1aa78 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end square_transposer_entity_3154c1aa78;

architecture structural of square_transposer_entity_3154c1aa78 is
  signal ce_1_sg_x368: std_logic;
  signal clk_1_sg_x368: std_logic;
  signal counter_op_net_x0: std_logic;
  signal delay0_q_net_x1: std_logic;
  signal delay_sync_q_net_x0: std_logic;
  signal delayb1_q_net_x1: std_logic_vector(35 downto 0);
  signal delayb2_q_net_x1: std_logic_vector(35 downto 0);
  signal delayf1_q_net_x0: std_logic_vector(35 downto 0);
  signal delayf2_q_net_x0: std_logic_vector(35 downto 0);
  signal mux11_y_net_x0: std_logic_vector(35 downto 0);
  signal mux21_y_net_x0: std_logic_vector(35 downto 0);
  signal node2_0_q_net_x1: std_logic_vector(35 downto 0);
  signal node2_2_q_net_x1: std_logic_vector(35 downto 0);
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x368 <= ce_1;
  clk_1_sg_x368 <= clk_1;
  node2_0_q_net_x1 <= in1;
  node2_2_q_net_x1 <= in2;
  sync_delay_q_net_x7 <= sync;
  out1 <= delayb1_q_net_x1;
  out2 <= delayb2_q_net_x1;
  sync_out <= delay0_q_net_x1;

  barrel_switcher_9e05cb67c4: entity work.barrel_switcher_entity_9e05cb67c4
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in1 => delayf1_q_net_x0,
      in2 => delayf2_q_net_x0,
      sel => counter_op_net_x0,
      sync_in => sync_delay_q_net_x7,
      out1 => mux11_y_net_x0,
      out2 => mux21_y_net_x0,
      sync_out => delay_sync_q_net_x0
    );

  counter: entity work.counter_9f61b180a8
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      rst(0) => sync_delay_q_net_x7,
      op(0) => counter_op_net_x0
    );

  delay0: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      d(0) => delay_sync_q_net_x0,
      en => '1',
      q(0) => delay0_q_net_x1
    );

  delayb1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      d => mux11_y_net_x0,
      en => '1',
      q => delayb1_q_net_x1
    );

  delayb2: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => mux21_y_net_x0,
      q => delayb2_q_net_x1
    );

  delayf1: entity work.delay_0c0a0420a6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => node2_0_q_net_x1,
      q => delayf1_q_net_x0
    );

  delayf2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      d => node2_2_q_net_x1,
      en => '1',
      q => delayf2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real/fft_unscrambler"

entity fft_unscrambler_entity_ff8c7853ab is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_unscrambler_entity_ff8c7853ab;

architecture structural of fft_unscrambler_entity_ff8c7853ab is
  signal bram0_data_out_net_x1: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x1: std_logic_vector(35 downto 0);
  signal ce_1_sg_x369: std_logic;
  signal clk_1_sg_x369: std_logic;
  signal const_op_net_x0: std_logic;
  signal delay0_q_net_x1: std_logic;
  signal delayb1_q_net_x1: std_logic_vector(35 downto 0);
  signal delayb2_q_net_x1: std_logic_vector(35 downto 0);
  signal node2_0_q_net_x2: std_logic_vector(35 downto 0);
  signal node2_2_q_net_x2: std_logic_vector(35 downto 0);
  signal post_sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x8: std_logic;

begin
  ce_1_sg_x369 <= ce_1;
  clk_1_sg_x369 <= clk_1;
  node2_0_q_net_x2 <= in1;
  node2_2_q_net_x2 <= in2;
  sync_delay_q_net_x8 <= sync;
  out1 <= bram0_data_out_net_x1;
  out2 <= bram1_data_out_net_x1;
  sync_out <= post_sync_delay_q_net_x1;

  const: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => const_op_net_x0
    );

  reorder_36e6f29898: entity work.reorder_entity_36e6f29898
    port map (
      ce_1 => ce_1_sg_x369,
      clk_1 => clk_1_sg_x369,
      din0 => delayb1_q_net_x1,
      din1 => delayb2_q_net_x1,
      en => const_op_net_x0,
      sync => delay0_q_net_x1,
      dout0 => bram0_data_out_net_x1,
      dout1 => bram1_data_out_net_x1,
      sync_out => post_sync_delay_q_net_x1
    );

  square_transposer_3154c1aa78: entity work.square_transposer_entity_3154c1aa78
    port map (
      ce_1 => ce_1_sg_x369,
      clk_1 => clk_1_sg_x369,
      in1 => node2_0_q_net_x2,
      in2 => node2_2_q_net_x2,
      sync => sync_delay_q_net_x8,
      out1 => delayb1_q_net_x1,
      out2 => delayb2_q_net_x1,
      sync_out => delay0_q_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/fft_wideband_real"

entity fft_wideband_real_entity_06b506694e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in0: in std_logic_vector(17 downto 0); 
    in1: in std_logic_vector(17 downto 0); 
    in2: in std_logic_vector(17 downto 0); 
    in3: in std_logic_vector(17 downto 0); 
    shift: in std_logic_vector(12 downto 0); 
    sync: in std_logic; 
    of_x0: out std_logic; 
    out0: out std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_wideband_real_entity_06b506694e;

architecture structural of fft_wideband_real_entity_06b506694e is
  signal bram0_data_out_net_x2: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x2: std_logic_vector(35 downto 0);
  signal ce_1_sg_x370: std_logic;
  signal clk_1_sg_x370: std_logic;
  signal delay2_q_net_x9: std_logic;
  signal delay_q_net_x5: std_logic;
  signal logical1_y_net_x5: std_logic;
  signal mux1_y_net_x4: std_logic_vector(35 downto 0);
  signal mux2_y_net_x4: std_logic_vector(35 downto 0);
  signal mux3_y_net_x4: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal node2_0_q_net_x2: std_logic_vector(35 downto 0);
  signal node2_2_q_net_x2: std_logic_vector(35 downto 0);
  signal of_or_y_net_x0: std_logic;
  signal of_or_y_net_x4: std_logic;
  signal post_sync_delay_q_net_x2: std_logic;
  signal shift1_op_net_x3: std_logic_vector(17 downto 0);
  signal shift2_op_net_x3: std_logic_vector(17 downto 0);
  signal shift3_op_net_x3: std_logic_vector(17 downto 0);
  signal shift4_op_net_x3: std_logic_vector(17 downto 0);
  signal slice6_y_net_x5: std_logic_vector(12 downto 0);
  signal slice_y_net_x0: std_logic_vector(1 downto 0);
  signal sync_delay_q_net_x8: std_logic;

begin
  ce_1_sg_x370 <= ce_1;
  clk_1_sg_x370 <= clk_1;
  shift3_op_net_x3 <= in0;
  shift1_op_net_x3 <= in1;
  shift2_op_net_x3 <= in2;
  shift4_op_net_x3 <= in3;
  slice6_y_net_x5 <= shift;
  delay_q_net_x5 <= sync;
  of_x0 <= of_or_y_net_x4;
  out0 <= bram0_data_out_net_x2;
  out1 <= bram1_data_out_net_x2;
  sync_out <= post_sync_delay_q_net_x2;

  fft_biplex_real_4x0_478ec5bf20: entity work.fft_biplex_real_4x0_entity_478ec5bf20
    port map (
      ce_1 => ce_1_sg_x370,
      clk_1 => clk_1_sg_x370,
      pol1 => shift3_op_net_x3,
      pol2 => shift1_op_net_x3,
      pol3 => shift2_op_net_x3,
      pol4 => shift4_op_net_x3,
      shift => slice6_y_net_x5,
      sync => delay_q_net_x5,
      of_x0 => logical1_y_net_x5,
      pol1_out => mux_y_net_x3,
      pol2_out => mux1_y_net_x4,
      pol3_out => mux2_y_net_x4,
      pol4_out => mux3_y_net_x4,
      sync_out => delay2_q_net_x9
    );

  fft_direct_94531946de: entity work.fft_direct_entity_94531946de
    port map (
      ce_1 => ce_1_sg_x370,
      clk_1 => clk_1_sg_x370,
      in0 => mux_y_net_x3,
      in1 => mux1_y_net_x4,
      in2 => mux2_y_net_x4,
      in3 => mux3_y_net_x4,
      shift => slice_y_net_x0,
      sync => delay2_q_net_x9,
      of_x0 => of_or_y_net_x0,
      out0 => node2_0_q_net_x2,
      out1 => node2_2_q_net_x2,
      sync_out => sync_delay_q_net_x8
    );

  fft_unscrambler_ff8c7853ab: entity work.fft_unscrambler_entity_ff8c7853ab
    port map (
      ce_1 => ce_1_sg_x370,
      clk_1 => clk_1_sg_x370,
      in1 => node2_0_q_net_x2,
      in2 => node2_2_q_net_x2,
      sync => sync_delay_q_net_x8,
      out1 => bram0_data_out_net_x2,
      out2 => bram1_data_out_net_x2,
      sync_out => post_sync_delay_q_net_x2
    );

  of_or: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      d0(0) => of_or_y_net_x0,
      d1(0) => logical1_y_net_x5,
      y(0) => of_or_y_net_x4
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 4,
      x_width => 13,
      y_width => 2
    )
    port map (
      x => slice6_y_net_x5,
      y => slice_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/led0_adc_clip"

entity led0_adc_clip_entity_1ad502548d is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end led0_adc_clip_entity_1ad502548d;

architecture structural of led0_adc_clip_entity_1ad502548d is
  signal convert_dout_net_x0: std_logic;
  signal inverter_op_net_x0: std_logic;

begin
  inverter_op_net_x0 <= gpio_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => inverter_op_net_x0,
      dout(0) => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/led3_new_acc"

entity led3_new_acc_entity_a7ee4986ff is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end led3_new_acc_entity_a7ee4986ff;

architecture structural of led3_new_acc_entity_a7ee4986ff is
  signal convert_dout_net_x0: std_logic;
  signal inverter3_op_net_x0: std_logic;

begin
  inverter3_op_net_x0 <= gpio_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => inverter3_op_net_x0,
      dout(0) => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/negedge_delay/negedge"

entity negedge_entity_25d3f1d00b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end negedge_entity_25d3f1d00b;

architecture structural of negedge_entity_25d3f1d00b is
  signal ce_1_sg_x677: std_logic;
  signal clk_1_sg_x677: std_logic;
  signal delay_q_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical4_y_net_x0: std_logic;
  signal logical_y_net_x0: std_logic;

begin
  ce_1_sg_x677 <= ce_1;
  clk_1_sg_x677 <= clk_1;
  logical4_y_net_x0 <= in_x0;
  out_x0 <= logical_y_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x677,
      clk => clk_1_sg_x677,
      d(0) => logical4_y_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x677,
      clk => clk_1_sg_x677,
      clr => '0',
      ip(0) => logical4_y_net_x0,
      op(0) => inverter_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net,
      d1(0) => inverter_op_net,
      y(0) => logical_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/negedge_delay"

entity negedge_delay_entity_b89abc8c2c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end negedge_delay_entity_b89abc8c2c;

architecture structural of negedge_delay_entity_b89abc8c2c is
  signal ce_1_sg_x678: std_logic;
  signal clk_1_sg_x678: std_logic;
  signal constant5_op_net: std_logic_vector(24 downto 0);
  signal counter3_op_net: std_logic_vector(24 downto 0);
  signal delay_q_net: std_logic;
  signal logical4_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x1: std_logic;
  signal relational5_op_net: std_logic;

begin
  ce_1_sg_x678 <= ce_1;
  clk_1_sg_x678 <= clk_1;
  logical4_y_net_x1 <= in_x0;
  out_x0 <= logical_y_net_x1;

  constant5: entity work.constant_70b906a85f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_55d5b22cdc7ae682",
      op_arith => xlUnsigned,
      op_width => 25
    )
    port map (
      ce => ce_1_sg_x678,
      clk => clk_1_sg_x678,
      clr => '0',
      en(0) => relational5_op_net,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  delay: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x678,
      clk => clk_1_sg_x678,
      clr => '0',
      d(0) => logical4_y_net_x1,
      q(0) => delay_q_net
    );

  logical: entity work.logical_6cb8f0ce02
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical4_y_net_x1,
      d1(0) => delay_q_net,
      d2(0) => relational5_op_net,
      y(0) => logical_y_net_x1
    );

  negedge_25d3f1d00b: entity work.negedge_entity_25d3f1d00b
    port map (
      ce_1 => ce_1_sg_x678,
      clk_1 => clk_1_sg_x678,
      in_x0 => logical4_y_net_x1,
      out_x0 => logical_y_net_x0
    );

  relational5: entity work.relational_e79d89798a
    port map (
      a => counter3_op_net,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/adder_1_1"

entity adder_1_1_entity_d42631ec4f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din1: in std_logic_vector(25 downto 0); 
    din2: in std_logic_vector(25 downto 0); 
    din3: in std_logic_vector(25 downto 0); 
    din4: in std_logic_vector(25 downto 0); 
    sync: in std_logic; 
    dout: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end adder_1_1_entity_d42631ec4f;

architecture structural of adder_1_1_entity_d42631ec4f is
  signal addr1_s_net: std_logic_vector(25 downto 0);
  signal addr2_s_net: std_logic_vector(25 downto 0);
  signal addr3_s_net_x0: std_logic_vector(25 downto 0);
  signal ce_1_sg_x681: std_logic;
  signal clk_1_sg_x681: std_logic;
  signal delay_q_net_x0: std_logic;
  signal mult_p_net_x3: std_logic_vector(25 downto 0);
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal mult_p_net_x5: std_logic_vector(25 downto 0);
  signal mult_p_net_x6: std_logic_vector(25 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x681 <= ce_1;
  clk_1_sg_x681 <= clk_1;
  mult_p_net_x3 <= din1;
  mult_p_net_x5 <= din2;
  mult_p_net_x6 <= din3;
  mult_p_net_x4 <= din4;
  delay_q_net_x0 <= sync;
  dout <= addr3_s_net_x0;
  sync_out <= sync_delay_q_net_x0;

  addr1: entity work.addsub_14e4f27748
    port map (
      a => mult_p_net_x3,
      b => mult_p_net_x5,
      ce => ce_1_sg_x681,
      clk => clk_1_sg_x681,
      clr => '0',
      s => addr1_s_net
    );

  addr2: entity work.addsub_14e4f27748
    port map (
      a => mult_p_net_x6,
      b => mult_p_net_x4,
      ce => ce_1_sg_x681,
      clk => clk_1_sg_x681,
      clr => '0',
      s => addr2_s_net
    );

  addr3: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 24,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 24,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 27,
      core_name0 => "addsb_11_0_3d8b6b3fb1293645",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 24,
      s_width => 26
    )
    port map (
      a => addr1_s_net,
      b => addr2_s_net,
      ce => ce_1_sg_x681,
      clk => clk_1_sg_x681,
      clr => '0',
      en => "1",
      s => addr3_s_net_x0
    );

  sync_delay: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x681,
      clk => clk_1_sg_x681,
      clr => '0',
      d(0) => delay_q_net_x0,
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/adder_1_2"

entity adder_1_2_entity_18aedfae91 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din1: in std_logic_vector(25 downto 0); 
    din2: in std_logic_vector(25 downto 0); 
    din3: in std_logic_vector(25 downto 0); 
    din4: in std_logic_vector(25 downto 0); 
    dout: out std_logic_vector(25 downto 0)
  );
end adder_1_2_entity_18aedfae91;

architecture structural of adder_1_2_entity_18aedfae91 is
  signal addr1_s_net: std_logic_vector(25 downto 0);
  signal addr2_s_net: std_logic_vector(25 downto 0);
  signal addr3_s_net_x0: std_logic_vector(25 downto 0);
  signal ce_1_sg_x682: std_logic;
  signal clk_1_sg_x682: std_logic;
  signal mult_p_net_x3: std_logic_vector(25 downto 0);
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal mult_p_net_x5: std_logic_vector(25 downto 0);
  signal mult_p_net_x6: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x682 <= ce_1;
  clk_1_sg_x682 <= clk_1;
  mult_p_net_x3 <= din1;
  mult_p_net_x5 <= din2;
  mult_p_net_x6 <= din3;
  mult_p_net_x4 <= din4;
  dout <= addr3_s_net_x0;

  addr1: entity work.addsub_14e4f27748
    port map (
      a => mult_p_net_x3,
      b => mult_p_net_x5,
      ce => ce_1_sg_x682,
      clk => clk_1_sg_x682,
      clr => '0',
      s => addr1_s_net
    );

  addr2: entity work.addsub_14e4f27748
    port map (
      a => mult_p_net_x6,
      b => mult_p_net_x4,
      ce => ce_1_sg_x682,
      clk => clk_1_sg_x682,
      clr => '0',
      s => addr2_s_net
    );

  addr3: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 24,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 24,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 27,
      core_name0 => "addsb_11_0_3d8b6b3fb1293645",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 24,
      s_width => 26
    )
    port map (
      a => addr1_s_net,
      b => addr2_s_net,
      ce => ce_1_sg_x682,
      clk => clk_1_sg_x682,
      clr => '0',
      en => "1",
      s => addr3_s_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_first_tap/delay_bram"

entity delay_bram_entity_ede029b7f3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)
  );
end delay_bram_entity_ede029b7f3;

architecture structural of delay_bram_entity_ede029b7f3 is
  signal ce_1_sg_x685: std_logic;
  signal clk_1_sg_x685: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay1_q_net_x0: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x685 <= ce_1;
  clk_1_sg_x685 <= clk_1;
  delay1_q_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x0;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 509,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_717486a23436c11d",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x685,
      clk => clk_1_sg_x685,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 9,
      c_width => 8,
      core_name0 => "bmg_33_1325b476538c741b",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x685,
      clk => clk_1_sg_x685,
      data_in => delay1_q_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_first_tap/pfb_coeff_gen"

entity pfb_coeff_gen_entity_5e20cee420 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff: out std_logic_vector(71 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end pfb_coeff_gen_entity_5e20cee420;

architecture structural of pfb_coeff_gen_entity_5e20cee420 is
  signal ce_1_sg_x686: std_logic;
  signal clk_1_sg_x686: std_logic;
  signal concat_y_net: std_logic_vector(71 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x4: std_logic;
  signal delay_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(7 downto 0);
  signal rom1_data_net: std_logic_vector(17 downto 0);
  signal rom2_data_net: std_logic_vector(17 downto 0);
  signal rom3_data_net: std_logic_vector(17 downto 0);
  signal rom4_data_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x686 <= ce_1;
  clk_1_sg_x686 <= clk_1;
  reinterpret_output_port_net_x1 <= din;
  delay2_q_net_x4 <= sync;
  coeff <= register_q_net_x0;
  dout <= delay1_q_net_x1;
  sync_out <= delay_q_net_x0;

  concat: entity work.concat_a246e373e7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concat_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      clr => '0',
      en => "1",
      rst(0) => delay2_q_net_x4,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      d(0) => delay2_q_net_x4,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      d => reinterpret_output_port_net_x1,
      en => '1',
      q => delay1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 72,
      init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      d => concat_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom2_data_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom3_data_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom4_data_net,
      output_port => reinterpret4_output_port_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_d0019849f5e57d19",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_15bd501b7a688725",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_b6ba55dfff01bfa7",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

  rom4: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_5dc95f5c2d6856d3",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x686,
      clk => clk_1_sg_x686,
      en => "1",
      rst => "0",
      data => rom4_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_first_tap/sync_delay"

entity sync_delay_entity_a74b984445 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_a74b984445;

architecture structural of sync_delay_entity_a74b984445 is
  signal ce_1_sg_x687: std_logic;
  signal clk_1_sg_x687: std_logic;
  signal constant1_op_net: std_logic_vector(9 downto 0);
  signal constant2_op_net: std_logic_vector(9 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(9 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x1: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x687 <= ce_1;
  clk_1_sg_x687 <= clk_1;
  delay_q_net_x1 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_498bc68c14
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_fbc2f0cce1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_f1ac4bddff
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_2373afd2271385cb",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x687,
      clk => clk_1_sg_x687,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x1,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x1,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x1,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_0ffd72e037
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_f6702ea2f7
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_first_tap"

entity pol1_in1_first_tap_entity_e88e23d72a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(53 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic; 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in1_first_tap_entity_e88e23d72a;

architecture structural of pol1_in1_first_tap_entity_e88e23d72a is
  signal ce_1_sg_x688: std_logic;
  signal clk_1_sg_x688: std_logic;
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x5: std_logic;
  signal delay_q_net_x1: std_logic;
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal mux_y_net_x1: std_logic;
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret_output_port_net_x2: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(53 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x688 <= ce_1;
  clk_1_sg_x688 <= clk_1;
  reinterpret_output_port_net_x2 <= din;
  delay2_q_net_x5 <= sync;
  coeff_out <= slice1_y_net_x0;
  dout <= single_port_ram_data_out_net_x1;
  sync_out <= mux_y_net_x1;
  taps_out <= mult_p_net_x4;

  delay_bram_ede029b7f3: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x688,
      clk_1 => clk_1_sg_x688,
      in1 => delay1_q_net_x1,
      out1 => single_port_ram_data_out_net_x1
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret2_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x688,
      clk => clk_1_sg_x688,
      clr => '0',
      p => mult_p_net_x4
    );

  pfb_coeff_gen_5e20cee420: entity work.pfb_coeff_gen_entity_5e20cee420
    port map (
      ce_1 => ce_1_sg_x688,
      clk_1 => clk_1_sg_x688,
      din => reinterpret_output_port_net_x2,
      sync => delay2_q_net_x5,
      coeff => register_q_net_x0,
      dout => delay1_q_net_x1,
      sync_out => delay_q_net_x1
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret2: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay1_q_net_x1,
      output_port => reinterpret2_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 72,
      y_width => 18
    )
    port map (
      x => register_q_net_x0,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 71,
      x_width => 72,
      y_width => 54
    )
    port map (
      x => register_q_net_x0,
      y => slice1_y_net_x0
    );

  sync_delay_a74b984445: entity work.sync_delay_entity_a74b984445
    port map (
      ce_1 => ce_1_sg_x688,
      clk_1 => clk_1_sg_x688,
      in_x0 => delay_q_net_x1,
      out_x0 => mux_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_last_tap"

entity pol1_in1_last_tap_entity_ad3c040941 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(17 downto 0); 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    sync_out: out std_logic; 
    tap_out: out std_logic_vector(25 downto 0)
  );
end pol1_in1_last_tap_entity_ad3c040941;

architecture structural of pol1_in1_last_tap_entity_ad3c040941 is
  signal ce_1_sg_x689: std_logic;
  signal clk_1_sg_x689: std_logic;
  signal delay_q_net_x1: std_logic;
  signal mult_p_net_x5: std_logic_vector(25 downto 0);
  signal mux_y_net_x0: std_logic;
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x689 <= ce_1;
  clk_1_sg_x689 <= clk_1;
  slice1_y_net_x0 <= coeff;
  single_port_ram_data_out_net_x0 <= din;
  mux_y_net_x0 <= sync;
  sync_out <= delay_q_net_x1;
  tap_out <= mult_p_net_x5;

  delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x689,
      clk => clk_1_sg_x689,
      d(0) => mux_y_net_x0,
      en => '1',
      q(0) => delay_q_net_x1
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret1_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x689,
      clk => clk_1_sg_x689,
      clr => '0',
      p => mult_p_net_x5
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_y_net_x0,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x0,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_tap2"

entity pol1_in1_tap2_entity_30d564a355 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(53 downto 0); 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(35 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic; 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in1_tap2_entity_30d564a355;

architecture structural of pol1_in1_tap2_entity_30d564a355 is
  signal ce_1_sg_x692: std_logic;
  signal clk_1_sg_x692: std_logic;
  signal mult_p_net_x6: std_logic_vector(25 downto 0);
  signal mux_y_net_x3: std_logic;
  signal mux_y_net_x4: std_logic;
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal slice1_y_net_x1: std_logic_vector(53 downto 0);
  signal slice1_y_net_x2: std_logic_vector(35 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x692 <= ce_1;
  clk_1_sg_x692 <= clk_1;
  slice1_y_net_x1 <= coeff;
  single_port_ram_data_out_net_x3 <= din;
  mux_y_net_x3 <= sync;
  coeff_out <= slice1_y_net_x2;
  dout <= single_port_ram_data_out_net_x4;
  sync_out <= mux_y_net_x4;
  taps_out <= mult_p_net_x6;

  delay_bram_aa660a3728: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x692,
      clk_1 => clk_1_sg_x692,
      in1 => single_port_ram_data_out_net_x3,
      out1 => single_port_ram_data_out_net_x4
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret1_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x692,
      clk => clk_1_sg_x692,
      clr => '0',
      p => mult_p_net_x6
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x3,
      output_port => reinterpret1_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 54,
      y_width => 18
    )
    port map (
      x => slice1_y_net_x1,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 53,
      x_width => 54,
      y_width => 36
    )
    port map (
      x => slice1_y_net_x1,
      y => slice1_y_net_x2
    );

  sync_delay_cadb3124db: entity work.sync_delay_entity_a74b984445
    port map (
      ce_1 => ce_1_sg_x692,
      clk_1 => clk_1_sg_x692,
      in_x0 => mux_y_net_x3,
      out_x0 => mux_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in1_tap3"

entity pol1_in1_tap3_entity_08a1364c39 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(35 downto 0); 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(17 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic; 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in1_tap3_entity_08a1364c39;

architecture structural of pol1_in1_tap3_entity_08a1364c39 is
  signal ce_1_sg_x695: std_logic;
  signal clk_1_sg_x695: std_logic;
  signal mult_p_net_x7: std_logic_vector(25 downto 0);
  signal mux_y_net_x2: std_logic;
  signal mux_y_net_x6: std_logic;
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal slice1_y_net_x3: std_logic_vector(35 downto 0);
  signal slice1_y_net_x4: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x695 <= ce_1;
  clk_1_sg_x695 <= clk_1;
  slice1_y_net_x3 <= coeff;
  single_port_ram_data_out_net_x6 <= din;
  mux_y_net_x6 <= sync;
  coeff_out <= slice1_y_net_x4;
  dout <= single_port_ram_data_out_net_x2;
  sync_out <= mux_y_net_x2;
  taps_out <= mult_p_net_x7;

  delay_bram_043aebc921: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x695,
      clk_1 => clk_1_sg_x695,
      in1 => single_port_ram_data_out_net_x6,
      out1 => single_port_ram_data_out_net_x2
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret1_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x695,
      clk => clk_1_sg_x695,
      clr => '0',
      p => mult_p_net_x7
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x6,
      output_port => reinterpret1_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => slice1_y_net_x3,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => slice1_y_net_x3,
      y => slice1_y_net_x4
    );

  sync_delay_46e10639e1: entity work.sync_delay_entity_a74b984445
    port map (
      ce_1 => ce_1_sg_x695,
      clk_1 => clk_1_sg_x695,
      in_x0 => mux_y_net_x6,
      out_x0 => mux_y_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in2_first_tap/pfb_coeff_gen"

entity pfb_coeff_gen_entity_27f9b7349b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff: out std_logic_vector(71 downto 0); 
    dout: out std_logic_vector(7 downto 0)
  );
end pfb_coeff_gen_entity_27f9b7349b;

architecture structural of pfb_coeff_gen_entity_27f9b7349b is
  signal ce_1_sg_x697: std_logic;
  signal clk_1_sg_x697: std_logic;
  signal concat_y_net: std_logic_vector(71 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x6: std_logic;
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret1_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(17 downto 0);
  signal rom1_data_net: std_logic_vector(17 downto 0);
  signal rom2_data_net: std_logic_vector(17 downto 0);
  signal rom3_data_net: std_logic_vector(17 downto 0);
  signal rom4_data_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x697 <= ce_1;
  clk_1_sg_x697 <= clk_1;
  reinterpret1_output_port_net_x1 <= din;
  delay2_q_net_x6 <= sync;
  coeff <= register_q_net_x0;
  dout <= delay1_q_net_x1;

  concat: entity work.concat_a246e373e7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concat_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      clr => '0',
      en => "1",
      rst(0) => delay2_q_net_x6,
      op => counter_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      d => reinterpret1_output_port_net_x1,
      en => '1',
      q => delay1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 72,
      init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      d => concat_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom2_data_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom3_data_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom4_data_net,
      output_port => reinterpret4_output_port_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_2619e307728164ad",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_00320b2c329850d2",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_9ce1016fece5c206",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

  rom4: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_6b8ccac7273df3c7",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x697,
      clk => clk_1_sg_x697,
      en => "1",
      rst => "0",
      data => rom4_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in2_first_tap"

entity pol1_in2_first_tap_entity_762f03a3df is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(53 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in2_first_tap_entity_762f03a3df;

architecture structural of pol1_in2_first_tap_entity_762f03a3df is
  signal ce_1_sg_x698: std_logic;
  signal clk_1_sg_x698: std_logic;
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x7: std_logic;
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(53 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x698 <= ce_1;
  clk_1_sg_x698 <= clk_1;
  reinterpret1_output_port_net_x2 <= din;
  delay2_q_net_x7 <= sync;
  coeff_out <= slice1_y_net_x0;
  dout <= single_port_ram_data_out_net_x1;
  taps_out <= mult_p_net_x4;

  delay_bram_b91cb8df7f: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x698,
      clk_1 => clk_1_sg_x698,
      in1 => delay1_q_net_x1,
      out1 => single_port_ram_data_out_net_x1
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret2_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x698,
      clk => clk_1_sg_x698,
      clr => '0',
      p => mult_p_net_x4
    );

  pfb_coeff_gen_27f9b7349b: entity work.pfb_coeff_gen_entity_27f9b7349b
    port map (
      ce_1 => ce_1_sg_x698,
      clk_1 => clk_1_sg_x698,
      din => reinterpret1_output_port_net_x2,
      sync => delay2_q_net_x7,
      coeff => register_q_net_x0,
      dout => delay1_q_net_x1
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret2: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay1_q_net_x1,
      output_port => reinterpret2_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 72,
      y_width => 18
    )
    port map (
      x => register_q_net_x0,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 71,
      x_width => 72,
      y_width => 54
    )
    port map (
      x => register_q_net_x0,
      y => slice1_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in2_last_tap"

entity pol1_in2_last_tap_entity_78ed98993f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(17 downto 0); 
    din: in std_logic_vector(7 downto 0); 
    tap_out: out std_logic_vector(25 downto 0)
  );
end pol1_in2_last_tap_entity_78ed98993f;

architecture structural of pol1_in2_last_tap_entity_78ed98993f is
  signal ce_1_sg_x699: std_logic;
  signal clk_1_sg_x699: std_logic;
  signal mult_p_net_x5: std_logic_vector(25 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x699 <= ce_1;
  clk_1_sg_x699 <= clk_1;
  slice1_y_net_x0 <= coeff;
  single_port_ram_data_out_net_x0 <= din;
  tap_out <= mult_p_net_x5;

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret1_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x699,
      clk => clk_1_sg_x699,
      clr => '0',
      p => mult_p_net_x5
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_y_net_x0,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x0,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in2_tap2"

entity pol1_in2_tap2_entity_68d1cee309 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(53 downto 0); 
    din: in std_logic_vector(7 downto 0); 
    coeff_out: out std_logic_vector(35 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in2_tap2_entity_68d1cee309;

architecture structural of pol1_in2_tap2_entity_68d1cee309 is
  signal ce_1_sg_x701: std_logic;
  signal clk_1_sg_x701: std_logic;
  signal mult_p_net_x6: std_logic_vector(25 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal slice1_y_net_x1: std_logic_vector(53 downto 0);
  signal slice1_y_net_x2: std_logic_vector(35 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x701 <= ce_1;
  clk_1_sg_x701 <= clk_1;
  slice1_y_net_x1 <= coeff;
  single_port_ram_data_out_net_x3 <= din;
  coeff_out <= slice1_y_net_x2;
  dout <= single_port_ram_data_out_net_x4;
  taps_out <= mult_p_net_x6;

  delay_bram_ceee0084c3: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x701,
      clk_1 => clk_1_sg_x701,
      in1 => single_port_ram_data_out_net_x3,
      out1 => single_port_ram_data_out_net_x4
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret1_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x701,
      clk => clk_1_sg_x701,
      clr => '0',
      p => mult_p_net_x6
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x3,
      output_port => reinterpret1_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 54,
      y_width => 18
    )
    port map (
      x => slice1_y_net_x1,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 53,
      x_width => 54,
      y_width => 36
    )
    port map (
      x => slice1_y_net_x1,
      y => slice1_y_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in2_tap3"

entity pol1_in2_tap3_entity_4a8515eef1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(35 downto 0); 
    din: in std_logic_vector(7 downto 0); 
    coeff_out: out std_logic_vector(17 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in2_tap3_entity_4a8515eef1;

architecture structural of pol1_in2_tap3_entity_4a8515eef1 is
  signal ce_1_sg_x703: std_logic;
  signal clk_1_sg_x703: std_logic;
  signal mult_p_net_x7: std_logic_vector(25 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal slice1_y_net_x3: std_logic_vector(35 downto 0);
  signal slice1_y_net_x4: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x703 <= ce_1;
  clk_1_sg_x703 <= clk_1;
  slice1_y_net_x3 <= coeff;
  single_port_ram_data_out_net_x6 <= din;
  coeff_out <= slice1_y_net_x4;
  dout <= single_port_ram_data_out_net_x2;
  taps_out <= mult_p_net_x7;

  delay_bram_79abb41aec: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x703,
      clk_1 => clk_1_sg_x703,
      in1 => single_port_ram_data_out_net_x6,
      out1 => single_port_ram_data_out_net_x2
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret1_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x703,
      clk => clk_1_sg_x703,
      clr => '0',
      p => mult_p_net_x7
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => single_port_ram_data_out_net_x6,
      output_port => reinterpret1_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => slice1_y_net_x3,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => slice1_y_net_x3,
      y => slice1_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in3_first_tap/pfb_coeff_gen"

entity pfb_coeff_gen_entity_2275889820 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff: out std_logic_vector(71 downto 0); 
    dout: out std_logic_vector(7 downto 0)
  );
end pfb_coeff_gen_entity_2275889820;

architecture structural of pfb_coeff_gen_entity_2275889820 is
  signal ce_1_sg_x705: std_logic;
  signal clk_1_sg_x705: std_logic;
  signal concat_y_net: std_logic_vector(71 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x8: std_logic;
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(17 downto 0);
  signal rom1_data_net: std_logic_vector(17 downto 0);
  signal rom2_data_net: std_logic_vector(17 downto 0);
  signal rom3_data_net: std_logic_vector(17 downto 0);
  signal rom4_data_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x705 <= ce_1;
  clk_1_sg_x705 <= clk_1;
  reinterpret2_output_port_net_x1 <= din;
  delay2_q_net_x8 <= sync;
  coeff <= register_q_net_x0;
  dout <= delay1_q_net_x1;

  concat: entity work.concat_a246e373e7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concat_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      clr => '0',
      en => "1",
      rst(0) => delay2_q_net_x8,
      op => counter_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      d => reinterpret2_output_port_net_x1,
      en => '1',
      q => delay1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 72,
      init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      d => concat_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom2_data_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom3_data_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom4_data_net,
      output_port => reinterpret4_output_port_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_77e902a23549a5af",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_3536f099f5b470e5",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_27ce3fa8185857c8",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

  rom4: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_69cf3e734d1f8889",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x705,
      clk => clk_1_sg_x705,
      en => "1",
      rst => "0",
      data => rom4_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in3_first_tap"

entity pol1_in3_first_tap_entity_de25ed57a8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(53 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in3_first_tap_entity_de25ed57a8;

architecture structural of pol1_in3_first_tap_entity_de25ed57a8 is
  signal ce_1_sg_x706: std_logic;
  signal clk_1_sg_x706: std_logic;
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x9: std_logic;
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x2: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(53 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x706 <= ce_1;
  clk_1_sg_x706 <= clk_1;
  reinterpret2_output_port_net_x2 <= din;
  delay2_q_net_x9 <= sync;
  coeff_out <= slice1_y_net_x0;
  dout <= single_port_ram_data_out_net_x1;
  taps_out <= mult_p_net_x4;

  delay_bram_be1c163988: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x706,
      clk_1 => clk_1_sg_x706,
      in1 => delay1_q_net_x1,
      out1 => single_port_ram_data_out_net_x1
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret2_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x706,
      clk => clk_1_sg_x706,
      clr => '0',
      p => mult_p_net_x4
    );

  pfb_coeff_gen_2275889820: entity work.pfb_coeff_gen_entity_2275889820
    port map (
      ce_1 => ce_1_sg_x706,
      clk_1 => clk_1_sg_x706,
      din => reinterpret2_output_port_net_x2,
      sync => delay2_q_net_x9,
      coeff => register_q_net_x0,
      dout => delay1_q_net_x1
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret2: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay1_q_net_x1,
      output_port => reinterpret2_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 72,
      y_width => 18
    )
    port map (
      x => register_q_net_x0,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 71,
      x_width => 72,
      y_width => 54
    )
    port map (
      x => register_q_net_x0,
      y => slice1_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in4_first_tap/pfb_coeff_gen"

entity pfb_coeff_gen_entity_8c7886eeea is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff: out std_logic_vector(71 downto 0); 
    dout: out std_logic_vector(7 downto 0)
  );
end pfb_coeff_gen_entity_8c7886eeea;

architecture structural of pfb_coeff_gen_entity_8c7886eeea is
  signal ce_1_sg_x713: std_logic;
  signal clk_1_sg_x713: std_logic;
  signal concat_y_net: std_logic_vector(71 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x10: std_logic;
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret3_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(17 downto 0);
  signal rom1_data_net: std_logic_vector(17 downto 0);
  signal rom2_data_net: std_logic_vector(17 downto 0);
  signal rom3_data_net: std_logic_vector(17 downto 0);
  signal rom4_data_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x713 <= ce_1;
  clk_1_sg_x713 <= clk_1;
  reinterpret3_output_port_net_x1 <= din;
  delay2_q_net_x10 <= sync;
  coeff <= register_q_net_x0;
  dout <= delay1_q_net_x1;

  concat: entity work.concat_a246e373e7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concat_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      clr => '0',
      en => "1",
      rst(0) => delay2_q_net_x10,
      op => counter_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      d => reinterpret3_output_port_net_x1,
      en => '1',
      q => delay1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 72,
      init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      d => concat_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom2_data_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom3_data_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom4_data_net,
      output_port => reinterpret4_output_port_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_26dc396f9efdb19d",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_1e456f34aa244a02",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_d4c4723e07af3139",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

  rom4: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_33_99d2859e4f5c4884",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x713,
      clk => clk_1_sg_x713,
      en => "1",
      rst => "0",
      data => rom4_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real/pol1_in4_first_tap"

entity pol1_in4_first_tap_entity_d74a19bd35 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(53 downto 0); 
    dout: out std_logic_vector(7 downto 0); 
    taps_out: out std_logic_vector(25 downto 0)
  );
end pol1_in4_first_tap_entity_d74a19bd35;

architecture structural of pol1_in4_first_tap_entity_d74a19bd35 is
  signal ce_1_sg_x714: std_logic;
  signal clk_1_sg_x714: std_logic;
  signal delay1_q_net_x1: std_logic_vector(7 downto 0);
  signal delay2_q_net_x11: std_logic;
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal register_q_net_x0: std_logic_vector(71 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x2: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(53 downto 0);
  signal slice_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x714 <= ce_1;
  clk_1_sg_x714 <= clk_1;
  reinterpret3_output_port_net_x2 <= din;
  delay2_q_net_x11 <= sync;
  coeff_out <= slice1_y_net_x0;
  dout <= single_port_ram_data_out_net_x1;
  taps_out <= mult_p_net_x4;

  delay_bram_2ef4b1d504: entity work.delay_bram_entity_ede029b7f3
    port map (
      ce_1 => ce_1_sg_x714,
      clk_1 => clk_1_sg_x714,
      in1 => delay1_q_net_x1,
      out1 => single_port_ram_data_out_net_x1
    );

  mult: entity work.mult_124cfbcd07
    port map (
      a => reinterpret2_output_port_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x714,
      clk => clk_1_sg_x714,
      clr => '0',
      p => mult_p_net_x4
    );

  pfb_coeff_gen_8c7886eeea: entity work.pfb_coeff_gen_entity_8c7886eeea
    port map (
      ce_1 => ce_1_sg_x714,
      clk_1 => clk_1_sg_x714,
      din => reinterpret3_output_port_net_x2,
      sync => delay2_q_net_x11,
      coeff => register_q_net_x0,
      dout => delay1_q_net_x1
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret2: entity work.reinterpret_d9988e3d87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay1_q_net_x1,
      output_port => reinterpret2_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 72,
      y_width => 18
    )
    port map (
      x => register_q_net_x0,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 71,
      x_width => 72,
      y_width => 54
    )
    port map (
      x => register_q_net_x0,
      y => slice1_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pfb_fir_real"

entity pfb_fir_real_entity_6a03e08f19 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol1_in1: in std_logic_vector(7 downto 0); 
    pol1_in2: in std_logic_vector(7 downto 0); 
    pol1_in3: in std_logic_vector(7 downto 0); 
    pol1_in4: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    pol1_out1: out std_logic_vector(17 downto 0); 
    pol1_out2: out std_logic_vector(17 downto 0); 
    pol1_out3: out std_logic_vector(17 downto 0); 
    pol1_out4: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end pfb_fir_real_entity_6a03e08f19;

architecture structural of pfb_fir_real_entity_6a03e08f19 is
  signal addr3_s_net_x0: std_logic_vector(25 downto 0);
  signal addr3_s_net_x1: std_logic_vector(25 downto 0);
  signal addr3_s_net_x2: std_logic_vector(25 downto 0);
  signal addr3_s_net_x3: std_logic_vector(25 downto 0);
  signal ce_1_sg_x720: std_logic;
  signal clk_1_sg_x720: std_logic;
  signal convert_1_1_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_3_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_4_dout_net_x1: std_logic_vector(17 downto 0);
  signal delay1_q_net_x1: std_logic;
  signal delay2_q_net_x12: std_logic;
  signal delay_q_net_x1: std_logic;
  signal mult_p_net_x10: std_logic_vector(25 downto 0);
  signal mult_p_net_x11: std_logic_vector(25 downto 0);
  signal mult_p_net_x12: std_logic_vector(25 downto 0);
  signal mult_p_net_x13: std_logic_vector(25 downto 0);
  signal mult_p_net_x14: std_logic_vector(25 downto 0);
  signal mult_p_net_x15: std_logic_vector(25 downto 0);
  signal mult_p_net_x16: std_logic_vector(25 downto 0);
  signal mult_p_net_x17: std_logic_vector(25 downto 0);
  signal mult_p_net_x18: std_logic_vector(25 downto 0);
  signal mult_p_net_x19: std_logic_vector(25 downto 0);
  signal mult_p_net_x4: std_logic_vector(25 downto 0);
  signal mult_p_net_x5: std_logic_vector(25 downto 0);
  signal mult_p_net_x6: std_logic_vector(25 downto 0);
  signal mult_p_net_x7: std_logic_vector(25 downto 0);
  signal mult_p_net_x8: std_logic_vector(25 downto 0);
  signal mult_p_net_x9: std_logic_vector(25 downto 0);
  signal mux_y_net_x2: std_logic;
  signal mux_y_net_x3: std_logic;
  signal mux_y_net_x6: std_logic;
  signal reinterpret1_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(7 downto 0);
  signal scale_1_1_op_net: std_logic_vector(25 downto 0);
  signal scale_1_2_op_net: std_logic_vector(25 downto 0);
  signal scale_1_3_op_net: std_logic_vector(25 downto 0);
  signal scale_1_4_op_net: std_logic_vector(25 downto 0);
  signal single_port_ram_data_out_net_x10: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x11: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x12: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x13: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x14: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x8: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x9: std_logic_vector(7 downto 0);
  signal slice1_y_net_x1: std_logic_vector(53 downto 0);
  signal slice1_y_net_x10: std_logic_vector(17 downto 0);
  signal slice1_y_net_x11: std_logic_vector(53 downto 0);
  signal slice1_y_net_x12: std_logic_vector(35 downto 0);
  signal slice1_y_net_x13: std_logic_vector(17 downto 0);
  signal slice1_y_net_x3: std_logic_vector(35 downto 0);
  signal slice1_y_net_x4: std_logic_vector(17 downto 0);
  signal slice1_y_net_x5: std_logic_vector(53 downto 0);
  signal slice1_y_net_x6: std_logic_vector(35 downto 0);
  signal slice1_y_net_x7: std_logic_vector(17 downto 0);
  signal slice1_y_net_x8: std_logic_vector(53 downto 0);
  signal slice1_y_net_x9: std_logic_vector(35 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x720 <= ce_1;
  clk_1_sg_x720 <= clk_1;
  reinterpret_output_port_net_x3 <= pol1_in1;
  reinterpret1_output_port_net_x3 <= pol1_in2;
  reinterpret2_output_port_net_x3 <= pol1_in3;
  reinterpret3_output_port_net_x3 <= pol1_in4;
  delay2_q_net_x12 <= sync;
  pol1_out1 <= convert_1_1_dout_net_x1;
  pol1_out2 <= convert_1_2_dout_net_x1;
  pol1_out3 <= convert_1_3_dout_net_x1;
  pol1_out4 <= convert_1_4_dout_net_x1;
  sync_out <= delay1_q_net_x1;

  adder_1_1_d42631ec4f: entity work.adder_1_1_entity_d42631ec4f
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din1 => mult_p_net_x4,
      din2 => mult_p_net_x6,
      din3 => mult_p_net_x7,
      din4 => mult_p_net_x5,
      sync => delay_q_net_x1,
      dout => addr3_s_net_x0,
      sync_out => sync_delay_q_net_x0
    );

  adder_1_2_18aedfae91: entity work.adder_1_2_entity_18aedfae91
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din1 => mult_p_net_x8,
      din2 => mult_p_net_x10,
      din3 => mult_p_net_x11,
      din4 => mult_p_net_x9,
      dout => addr3_s_net_x1
    );

  adder_1_3_15a784c2de: entity work.adder_1_2_entity_18aedfae91
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din1 => mult_p_net_x12,
      din2 => mult_p_net_x14,
      din3 => mult_p_net_x15,
      din4 => mult_p_net_x13,
      dout => addr3_s_net_x2
    );

  adder_1_4_da2aca1731: entity work.adder_1_2_entity_18aedfae91
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din1 => mult_p_net_x16,
      din2 => mult_p_net_x18,
      din3 => mult_p_net_x19,
      din4 => mult_p_net_x17,
      dout => addr3_s_net_x3
    );

  convert_1_1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 25,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x720,
      clk => clk_1_sg_x720,
      clr => '0',
      din => scale_1_1_op_net,
      dout => convert_1_1_dout_net_x1
    );

  convert_1_2: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 25,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x720,
      clk => clk_1_sg_x720,
      clr => '0',
      din => scale_1_2_op_net,
      dout => convert_1_2_dout_net_x1
    );

  convert_1_3: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 25,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x720,
      clk => clk_1_sg_x720,
      clr => '0',
      din => scale_1_3_op_net,
      dout => convert_1_3_dout_net_x1
    );

  convert_1_4: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 25,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x720,
      clk => clk_1_sg_x720,
      clr => '0',
      din => scale_1_4_op_net,
      dout => convert_1_4_dout_net_x1
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x720,
      clk => clk_1_sg_x720,
      d(0) => sync_delay_q_net_x0,
      en => '1',
      q(0) => delay1_q_net_x1
    );

  pol1_in1_first_tap_e88e23d72a: entity work.pol1_in1_first_tap_entity_e88e23d72a
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din => reinterpret_output_port_net_x3,
      sync => delay2_q_net_x12,
      coeff_out => slice1_y_net_x1,
      dout => single_port_ram_data_out_net_x3,
      sync_out => mux_y_net_x3,
      taps_out => mult_p_net_x4
    );

  pol1_in1_last_tap_ad3c040941: entity work.pol1_in1_last_tap_entity_ad3c040941
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x4,
      din => single_port_ram_data_out_net_x2,
      sync => mux_y_net_x2,
      sync_out => delay_q_net_x1,
      tap_out => mult_p_net_x5
    );

  pol1_in1_tap2_30d564a355: entity work.pol1_in1_tap2_entity_30d564a355
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x1,
      din => single_port_ram_data_out_net_x3,
      sync => mux_y_net_x3,
      coeff_out => slice1_y_net_x3,
      dout => single_port_ram_data_out_net_x6,
      sync_out => mux_y_net_x6,
      taps_out => mult_p_net_x6
    );

  pol1_in1_tap3_08a1364c39: entity work.pol1_in1_tap3_entity_08a1364c39
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x3,
      din => single_port_ram_data_out_net_x6,
      sync => mux_y_net_x6,
      coeff_out => slice1_y_net_x4,
      dout => single_port_ram_data_out_net_x2,
      sync_out => mux_y_net_x2,
      taps_out => mult_p_net_x7
    );

  pol1_in2_first_tap_762f03a3df: entity work.pol1_in2_first_tap_entity_762f03a3df
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din => reinterpret1_output_port_net_x3,
      sync => delay2_q_net_x12,
      coeff_out => slice1_y_net_x5,
      dout => single_port_ram_data_out_net_x7,
      taps_out => mult_p_net_x8
    );

  pol1_in2_last_tap_78ed98993f: entity work.pol1_in2_last_tap_entity_78ed98993f
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x7,
      din => single_port_ram_data_out_net_x4,
      tap_out => mult_p_net_x9
    );

  pol1_in2_tap2_68d1cee309: entity work.pol1_in2_tap2_entity_68d1cee309
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x5,
      din => single_port_ram_data_out_net_x7,
      coeff_out => slice1_y_net_x6,
      dout => single_port_ram_data_out_net_x8,
      taps_out => mult_p_net_x10
    );

  pol1_in2_tap3_4a8515eef1: entity work.pol1_in2_tap3_entity_4a8515eef1
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x6,
      din => single_port_ram_data_out_net_x8,
      coeff_out => slice1_y_net_x7,
      dout => single_port_ram_data_out_net_x4,
      taps_out => mult_p_net_x11
    );

  pol1_in3_first_tap_de25ed57a8: entity work.pol1_in3_first_tap_entity_de25ed57a8
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din => reinterpret2_output_port_net_x3,
      sync => delay2_q_net_x12,
      coeff_out => slice1_y_net_x8,
      dout => single_port_ram_data_out_net_x9,
      taps_out => mult_p_net_x12
    );

  pol1_in3_last_tap_df49cc8b0f: entity work.pol1_in2_last_tap_entity_78ed98993f
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x10,
      din => single_port_ram_data_out_net_x11,
      tap_out => mult_p_net_x13
    );

  pol1_in3_tap2_6cd3f95407: entity work.pol1_in2_tap2_entity_68d1cee309
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x8,
      din => single_port_ram_data_out_net_x9,
      coeff_out => slice1_y_net_x9,
      dout => single_port_ram_data_out_net_x10,
      taps_out => mult_p_net_x14
    );

  pol1_in3_tap3_30762030c8: entity work.pol1_in2_tap3_entity_4a8515eef1
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x9,
      din => single_port_ram_data_out_net_x10,
      coeff_out => slice1_y_net_x10,
      dout => single_port_ram_data_out_net_x11,
      taps_out => mult_p_net_x15
    );

  pol1_in4_first_tap_d74a19bd35: entity work.pol1_in4_first_tap_entity_d74a19bd35
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      din => reinterpret3_output_port_net_x3,
      sync => delay2_q_net_x12,
      coeff_out => slice1_y_net_x11,
      dout => single_port_ram_data_out_net_x12,
      taps_out => mult_p_net_x16
    );

  pol1_in4_last_tap_a81414d044: entity work.pol1_in2_last_tap_entity_78ed98993f
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x13,
      din => single_port_ram_data_out_net_x14,
      tap_out => mult_p_net_x17
    );

  pol1_in4_tap2_19cc27ef93: entity work.pol1_in2_tap2_entity_68d1cee309
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x11,
      din => single_port_ram_data_out_net_x12,
      coeff_out => slice1_y_net_x12,
      dout => single_port_ram_data_out_net_x13,
      taps_out => mult_p_net_x18
    );

  pol1_in4_tap3_74309e0d6d: entity work.pol1_in2_tap3_entity_4a8515eef1
    port map (
      ce_1 => ce_1_sg_x720,
      clk_1 => clk_1_sg_x720,
      coeff => slice1_y_net_x12,
      din => single_port_ram_data_out_net_x13,
      coeff_out => slice1_y_net_x13,
      dout => single_port_ram_data_out_net_x14,
      taps_out => mult_p_net_x19
    );

  scale_1_1: entity work.scale_f01f7ce486
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x0,
      op => scale_1_1_op_net
    );

  scale_1_2: entity work.scale_f01f7ce486
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x1,
      op => scale_1_2_op_net
    );

  scale_1_3: entity work.scale_f01f7ce486
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x2,
      op => scale_1_3_op_net
    );

  scale_1_4: entity work.scale_f01f7ce486
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x3,
      op => scale_1_4_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pol_pack0"

entity pol_pack0_entity_aeb6388850 is
  port (
    in1: in std_logic_vector(7 downto 0); 
    in2: in std_logic_vector(7 downto 0); 
    in3: in std_logic_vector(7 downto 0); 
    in4: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(31 downto 0)
  );
end pol_pack0_entity_aeb6388850;

architecture structural of pol_pack0_entity_aeb6388850 is
  signal concat3_y_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(7 downto 0);

begin
  reinterpret_output_port_net_x12 <= in1;
  reinterpret_output_port_net_x13 <= in2;
  reinterpret_output_port_net_x14 <= in3;
  reinterpret_output_port_net_x15 <= in4;
  out1 <= concat3_y_net_x0;

  concat3: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret4_output_port_net,
      in1 => reinterpret5_output_port_net,
      in2 => reinterpret6_output_port_net,
      in3 => reinterpret7_output_port_net,
      y => concat3_y_net_x0
    );

  reinterpret4: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret_output_port_net_x12,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret_output_port_net_x13,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret_output_port_net_x14,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret_output_port_net_x15,
      output_port => reinterpret7_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/pulse_ext2"

entity pulse_ext2_entity_4b5b2f17d0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext2_entity_4b5b2f17d0;

architecture structural of pulse_ext2_entity_4b5b2f17d0 is
  signal ce_1_sg_x845: std_logic;
  signal clk_1_sg_x845: std_logic;
  signal constant5_op_net: std_logic_vector(24 downto 0);
  signal counter3_op_net: std_logic_vector(24 downto 0);
  signal delay2_q_net_x41: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  ce_1_sg_x845 <= ce_1;
  clk_1_sg_x845 <= clk_1;
  delay2_q_net_x41 <= in_x0;
  out_x0 <= relational5_op_net_x0;

  constant5: entity work.constant_2ae71e3b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_55d5b22cdc7ae682",
      op_arith => xlUnsigned,
      op_width => 25
    )
    port map (
      ce => ce_1_sg_x845,
      clk => clk_1_sg_x845,
      clr => '0',
      en(0) => relational5_op_net_x0,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_beb16bedf1: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x845,
      clk_1 => clk_1_sg_x845,
      in_x0 => delay2_q_net_x41,
      out_x0 => logical_y_net_x0
    );

  relational5: entity work.relational_487ac75be9
    port map (
      a => counter3_op_net,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant0/eq_store0"

entity eq_store0_entity_31e887c1bd is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(17 downto 0); 
    coeff_addr: in std_logic_vector(9 downto 0); 
    sync: in std_logic; 
    scale: out std_logic_vector(35 downto 0)
  );
end eq_store0_entity_31e887c1bd;

architecture structural of eq_store0_entity_31e887c1bd is
  signal assert1_dout_net: std_logic_vector(17 downto 0);
  signal assert_dout_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x848: std_logic;
  signal clk_1_sg_x848: std_logic;
  signal constant4_op_net: std_logic_vector(35 downto 0);
  signal constant5_op_net: std_logic;
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal counter2_op_net: std_logic_vector(8 downto 0);
  signal delay17_q_net_x0: std_logic_vector(9 downto 0);
  signal delay_q_net: std_logic_vector(9 downto 0);
  signal dp_ram_doutb_net_x0: std_logic_vector(35 downto 0);
  signal post_sync_delay_q_net_x3: std_logic;
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x848 <= ce_1;
  clk_1_sg_x848 <= clk_1;
  convert_dout_net_x0 <= coeff;
  delay17_q_net_x0 <= coeff_addr;
  post_sync_delay_q_net_x3 <= sync;
  scale <= dp_ram_doutb_net_x0;

  assert1: entity work.xlpassthrough
    generic map (
      din_width => 18,
      dout_width => 18
    )
    port map (
      din => convert_dout_net_x0,
      dout => assert1_dout_net
    );

  assert_x0: entity work.xlpassthrough
    generic map (
      din_width => 10,
      dout_width => 10
    )
    port map (
      din => delay17_q_net_x0,
      dout => assert_dout_net
    );

  constant4: entity work.constant_bbd7b31fe5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant5_op_net
    );

  counter2: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_717486a23436c11d",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x848,
      clk => clk_1_sg_x848,
      clr => '0',
      en => "1",
      rst(0) => post_sync_delay_q_net_x3,
      op => counter2_op_net
    );

  delay: entity work.delay_cf4f99539f
    port map (
      ce => ce_1_sg_x848,
      clk => clk_1_sg_x848,
      clr => '0',
      d => assert_dout_net,
      q => delay_q_net
    );

  dp_ram: entity work.xldpram
    generic map (
      c_address_width_a => 10,
      c_address_width_b => 9,
      c_width_a => 18,
      c_width_b => 36,
      core_name0 => "bmg_33_7b1af72e0df0a688",
      latency => 2
    )
    port map (
      a_ce => ce_1_sg_x848,
      a_clk => clk_1_sg_x848,
      addra => assert_dout_net,
      addrb => counter2_op_net,
      b_ce => ce_1_sg_x848,
      b_clk => clk_1_sg_x848,
      dina => reinterpret1_output_port_net,
      dinb => constant4_op_net,
      ena => "1",
      enb => "1",
      rsta => "0",
      rstb => "0",
      wea(0) => relational_op_net,
      web(0) => constant5_op_net,
      doutb => dp_ram_doutb_net_x0
    );

  reinterpret1: entity work.reinterpret_9306b5127f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => assert1_dout_net,
      output_port => reinterpret1_output_port_net
    );

  relational: entity work.relational_1a5580632c
    port map (
      a => assert_dout_net,
      b => delay_q_net,
      ce => ce_1_sg_x848,
      clk => clk_1_sg_x848,
      clr => '0',
      op(0) => relational_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant0/round0"

entity round0_entity_f9fb156758 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(35 downto 0); 
    scale: in std_logic_vector(17 downto 0); 
    clip: out std_logic; 
    dout: out std_logic_vector(7 downto 0)
  );
end round0_entity_f9fb156758;

architecture structural of round0_entity_f9fb156758 is
  signal ce_1_sg_x849: std_logic;
  signal clk_1_sg_x849: std_logic;
  signal concat1_y_net: std_logic_vector(1 downto 0);
  signal concat2_y_net: std_logic_vector(1 downto 0);
  signal concat_y_net_x0: std_logic_vector(7 downto 0);
  signal constant1_op_net: std_logic_vector(26 downto 0);
  signal constant2_op_net: std_logic_vector(3 downto 0);
  signal constant3_op_net: std_logic_vector(3 downto 0);
  signal constant4_op_net: std_logic_vector(26 downto 0);
  signal constant5_op_net: std_logic_vector(26 downto 0);
  signal constant6_op_net: std_logic_vector(3 downto 0);
  signal constant7_op_net: std_logic_vector(3 downto 0);
  signal constant_op_net: std_logic_vector(26 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(3 downto 0);
  signal convert3_dout_net: std_logic_vector(3 downto 0);
  signal delay3_q_net_x0: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal mux1_y_net: std_logic_vector(3 downto 0);
  signal mux_y_net: std_logic_vector(3 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice4_y_net: std_logic_vector(17 downto 0);
  signal slice5_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x849 <= ce_1;
  clk_1_sg_x849 <= clk_1;
  delay3_q_net_x0 <= din;
  convert1_dout_net_x0 <= scale;
  clip <= logical1_y_net_x0;
  dout <= concat_y_net_x0;

  concat: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret3_output_port_net,
      y => concat_y_net_x0
    );

  concat1: entity work.concat_32afb77cd2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational1_op_net,
      in1(0) => relational_op_net,
      y => concat1_y_net
    );

  concat2: entity work.concat_32afb77cd2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational3_op_net,
      in1(0) => relational2_op_net,
      y => concat2_y_net
    );

  constant1: entity work.constant_3d1b04c74c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_a3d619979c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_a629aefb53
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity work.constant_3ee5f91fcf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_3d1b04c74c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  constant6: entity work.constant_a3d619979c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant6_op_net
    );

  constant7: entity work.constant_a629aefb53
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant7_op_net
    );

  constant_x0: entity work.constant_3ee5f91fcf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  convert2: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 20,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 4,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      din => mult_p_net,
      dout => convert2_dout_net
    );

  convert3: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 20,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 4,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      din => mult1_p_net,
      dout => convert3_dout_net
    );

  logical1: entity work.logical_127a315f20
    port map (
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => relational1_op_net,
      d2(0) => relational3_op_net,
      d3(0) => relational2_op_net,
      y(0) => logical1_y_net_x0
    );

  mult: entity work.mult_8d498c3012
    port map (
      a => reinterpret_output_port_net,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      p => mult_p_net
    );

  mult1: entity work.mult_8d498c3012
    port map (
      a => reinterpret1_output_port_net,
      b => convert1_dout_net_x0,
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      p => mult1_p_net
    );

  mux: entity work.mux_9723c3381b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert2_dout_net,
      d1 => constant2_op_net,
      d2 => constant3_op_net,
      sel => concat1_y_net,
      y => mux_y_net
    );

  mux1: entity work.mux_9723c3381b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert3_dout_net,
      d1 => constant6_op_net,
      d2 => constant7_op_net,
      sel => concat2_y_net,
      y => mux1_y_net
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice4_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice5_y_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux_y_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux1_y_net,
      output_port => reinterpret3_output_port_net
    );

  relational: entity work.relational_ecc398b3c4
    port map (
      a => mult_p_net,
      b => constant_op_net,
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_1661032f65
    port map (
      a => mult_p_net,
      b => constant1_op_net,
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_ecc398b3c4
    port map (
      a => mult1_p_net,
      b => constant4_op_net,
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_1661032f65
    port map (
      a => mult1_p_net,
      b => constant5_op_net,
      ce => ce_1_sg_x849,
      clk => clk_1_sg_x849,
      clr => '0',
      op(0) => relational3_op_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay3_q_net_x0,
      y => slice4_y_net
    );

  slice5: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay3_q_net_x0,
      y => slice5_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant0/round1"

entity round1_entity_c520d66b3c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(35 downto 0); 
    scale: in std_logic_vector(17 downto 0); 
    clip: out std_logic; 
    dout: out std_logic_vector(7 downto 0)
  );
end round1_entity_c520d66b3c;

architecture structural of round1_entity_c520d66b3c is
  signal ce_1_sg_x850: std_logic;
  signal clk_1_sg_x850: std_logic;
  signal concat1_y_net: std_logic_vector(1 downto 0);
  signal concat2_y_net: std_logic_vector(1 downto 0);
  signal concat_y_net_x0: std_logic_vector(7 downto 0);
  signal constant1_op_net: std_logic_vector(26 downto 0);
  signal constant2_op_net: std_logic_vector(3 downto 0);
  signal constant3_op_net: std_logic_vector(3 downto 0);
  signal constant4_op_net: std_logic_vector(26 downto 0);
  signal constant5_op_net: std_logic_vector(26 downto 0);
  signal constant6_op_net: std_logic_vector(3 downto 0);
  signal constant7_op_net: std_logic_vector(3 downto 0);
  signal constant_op_net: std_logic_vector(26 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(3 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert3_dout_net: std_logic_vector(3 downto 0);
  signal delay2_q_net_x0: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal mux1_y_net: std_logic_vector(3 downto 0);
  signal mux_y_net: std_logic_vector(3 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice4_y_net: std_logic_vector(17 downto 0);
  signal slice5_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x850 <= ce_1;
  clk_1_sg_x850 <= clk_1;
  delay2_q_net_x0 <= din;
  convert2_dout_net_x1 <= scale;
  clip <= logical1_y_net_x0;
  dout <= concat_y_net_x0;

  concat: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret3_output_port_net,
      y => concat_y_net_x0
    );

  concat1: entity work.concat_32afb77cd2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational1_op_net,
      in1(0) => relational_op_net,
      y => concat1_y_net
    );

  concat2: entity work.concat_32afb77cd2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational3_op_net,
      in1(0) => relational2_op_net,
      y => concat2_y_net
    );

  constant1: entity work.constant_3d1b04c74c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_a3d619979c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_a629aefb53
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity work.constant_3ee5f91fcf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_3d1b04c74c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  constant6: entity work.constant_a3d619979c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant6_op_net
    );

  constant7: entity work.constant_a629aefb53
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant7_op_net
    );

  constant_x0: entity work.constant_3ee5f91fcf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 20,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 4,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      din => mult_p_net,
      dout => convert2_dout_net_x0
    );

  convert3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 20,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 4,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      din => mult1_p_net,
      dout => convert3_dout_net
    );

  logical1: entity work.logical_127a315f20
    port map (
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => relational1_op_net,
      d2(0) => relational3_op_net,
      d3(0) => relational2_op_net,
      y(0) => logical1_y_net_x0
    );

  mult: entity work.mult_8d498c3012
    port map (
      a => reinterpret_output_port_net,
      b => convert2_dout_net_x1,
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      p => mult_p_net
    );

  mult1: entity work.mult_8d498c3012
    port map (
      a => reinterpret1_output_port_net,
      b => convert2_dout_net_x1,
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      p => mult1_p_net
    );

  mux: entity work.mux_9723c3381b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert2_dout_net_x0,
      d1 => constant2_op_net,
      d2 => constant3_op_net,
      sel => concat1_y_net,
      y => mux_y_net
    );

  mux1: entity work.mux_9723c3381b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert3_dout_net,
      d1 => constant6_op_net,
      d2 => constant7_op_net,
      sel => concat2_y_net,
      y => mux1_y_net
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice4_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice5_y_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux_y_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux1_y_net,
      output_port => reinterpret3_output_port_net
    );

  relational: entity work.relational_ecc398b3c4
    port map (
      a => mult_p_net,
      b => constant_op_net,
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_1661032f65
    port map (
      a => mult_p_net,
      b => constant1_op_net,
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_ecc398b3c4
    port map (
      a => mult1_p_net,
      b => constant4_op_net,
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_1661032f65
    port map (
      a => mult1_p_net,
      b => constant5_op_net,
      ce => ce_1_sg_x850,
      clk => clk_1_sg_x850,
      clr => '0',
      op(0) => relational3_op_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay2_q_net_x0,
      y => slice4_y_net
    );

  slice5: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay2_q_net_x0,
      y => slice5_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant0"

entity quant0_entity_f9a8447551 is
  port (
    baopoco_quant0_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant0_gain_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    clip_out: out std_logic; 
    dout0: out std_logic_vector(7 downto 0); 
    dout1: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end quant0_entity_f9a8447551;

architecture structural of quant0_entity_f9a8447551 is
  signal baopoco_quant0_addr_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal baopoco_quant0_gain_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal bram0_data_out_net_x3: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x3: std_logic_vector(35 downto 0);
  signal ce_1_sg_x851: std_logic;
  signal clk_1_sg_x851: std_logic;
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal concat_y_net_x3: std_logic_vector(7 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal delay15_q_net: std_logic_vector(17 downto 0);
  signal delay17_q_net_x0: std_logic_vector(9 downto 0);
  signal delay18_q_net: std_logic_vector(35 downto 0);
  signal delay19_q_net: std_logic;
  signal delay1_q_net: std_logic_vector(35 downto 0);
  signal delay25_q_net: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic_vector(35 downto 0);
  signal delay3_q_net_x0: std_logic_vector(35 downto 0);
  signal delay4_q_net_x1: std_logic;
  signal delay5_q_net_x7: std_logic;
  signal dp_ram_doutb_net_x0: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical5_y_net: std_logic;
  signal post_sync_delay_q_net_x4: std_logic;
  signal slice11_y_net: std_logic_vector(17 downto 0);
  signal slice14_y_net: std_logic_vector(17 downto 0);
  signal slice40_y_net: std_logic_vector(17 downto 0);
  signal slice7_y_net: std_logic_vector(9 downto 0);

begin
  baopoco_quant0_addr_user_data_out_net_x0 <= baopoco_quant0_addr_user_data_out;
  baopoco_quant0_gain_user_data_out_net_x0 <= baopoco_quant0_gain_user_data_out;
  ce_1_sg_x851 <= ce_1;
  clk_1_sg_x851 <= clk_1;
  bram0_data_out_net_x3 <= din0;
  bram1_data_out_net_x3 <= din1;
  post_sync_delay_q_net_x4 <= sync;
  clip_out <= delay5_q_net_x7;
  dout0 <= concat_y_net_x2;
  dout1 <= concat_y_net_x3;
  sync_out <= delay4_q_net_x1;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => delay15_q_net,
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice14_y_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice11_y_net,
      dout => convert2_dout_net_x1
    );

  delay1: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d => dp_ram_doutb_net_x0,
      q => delay1_q_net
    );

  delay15: entity work.delay_b6092ad150
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d => slice40_y_net,
      q => delay15_q_net
    );

  delay17: entity work.delay_cf4f99539f
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d => slice7_y_net,
      q => delay17_q_net_x0
    );

  delay18: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      d => bram0_data_out_net_x3,
      en => '1',
      q => delay18_q_net
    );

  delay19: entity work.xldelay
    generic map (
      latency => 7,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      d(0) => post_sync_delay_q_net_x4,
      en => '1',
      q(0) => delay19_q_net
    );

  delay2: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d => delay25_q_net,
      q => delay2_q_net_x0
    );

  delay25: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      d => bram1_data_out_net_x3,
      en => '1',
      q => delay25_q_net
    );

  delay3: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d => delay18_q_net,
      q => delay3_q_net_x0
    );

  delay4: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d(0) => delay19_q_net,
      q(0) => delay4_q_net_x1
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x851,
      clk => clk_1_sg_x851,
      clr => '0',
      d(0) => logical5_y_net,
      q(0) => delay5_q_net_x7
    );

  eq_store0_31e887c1bd: entity work.eq_store0_entity_31e887c1bd
    port map (
      ce_1 => ce_1_sg_x851,
      clk_1 => clk_1_sg_x851,
      coeff => convert_dout_net_x0,
      coeff_addr => delay17_q_net_x0,
      sync => post_sync_delay_q_net_x4,
      scale => dp_ram_doutb_net_x0
    );

  logical5: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical1_y_net_x0,
      d1(0) => logical1_y_net_x1,
      y(0) => logical5_y_net
    );

  round0_f9fb156758: entity work.round0_entity_f9fb156758
    port map (
      ce_1 => ce_1_sg_x851,
      clk_1 => clk_1_sg_x851,
      din => delay3_q_net_x0,
      scale => convert1_dout_net_x0,
      clip => logical1_y_net_x0,
      dout => concat_y_net_x2
    );

  round1_c520d66b3c: entity work.round1_entity_c520d66b3c
    port map (
      ce_1 => ce_1_sg_x851,
      clk_1 => clk_1_sg_x851,
      din => delay2_q_net_x0,
      scale => convert2_dout_net_x1,
      clip => logical1_y_net_x1,
      dout => concat_y_net_x3
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice11_y_net
    );

  slice14: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice14_y_net
    );

  slice40: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => baopoco_quant0_gain_user_data_out_net_x0,
      y => slice40_y_net
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 32,
      y_width => 10
    )
    port map (
      x => baopoco_quant0_addr_user_data_out_net_x0,
      y => slice7_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant1"

entity quant1_entity_3ae2e9f529 is
  port (
    baopoco_quant1_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant1_gain_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    clip_out: out std_logic; 
    dout0: out std_logic_vector(7 downto 0); 
    dout1: out std_logic_vector(7 downto 0)
  );
end quant1_entity_3ae2e9f529;

architecture structural of quant1_entity_3ae2e9f529 is
  signal baopoco_quant1_addr_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal baopoco_quant1_gain_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal bram0_data_out_net_x3: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x3: std_logic_vector(35 downto 0);
  signal ce_1_sg_x855: std_logic;
  signal clk_1_sg_x855: std_logic;
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal concat_y_net_x3: std_logic_vector(7 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal delay15_q_net: std_logic_vector(17 downto 0);
  signal delay17_q_net_x0: std_logic_vector(9 downto 0);
  signal delay18_q_net: std_logic_vector(35 downto 0);
  signal delay1_q_net: std_logic_vector(35 downto 0);
  signal delay25_q_net: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic_vector(35 downto 0);
  signal delay3_q_net_x0: std_logic_vector(35 downto 0);
  signal delay5_q_net_x8: std_logic;
  signal dp_ram_doutb_net_x0: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical5_y_net: std_logic;
  signal post_sync_delay_q_net_x4: std_logic;
  signal slice11_y_net: std_logic_vector(17 downto 0);
  signal slice14_y_net: std_logic_vector(17 downto 0);
  signal slice40_y_net: std_logic_vector(17 downto 0);
  signal slice7_y_net: std_logic_vector(9 downto 0);

begin
  baopoco_quant1_addr_user_data_out_net_x0 <= baopoco_quant1_addr_user_data_out;
  baopoco_quant1_gain_user_data_out_net_x0 <= baopoco_quant1_gain_user_data_out;
  ce_1_sg_x855 <= ce_1;
  clk_1_sg_x855 <= clk_1;
  bram0_data_out_net_x3 <= din0;
  bram1_data_out_net_x3 <= din1;
  post_sync_delay_q_net_x4 <= sync;
  clip_out <= delay5_q_net_x8;
  dout0 <= concat_y_net_x2;
  dout1 <= concat_y_net_x3;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => delay15_q_net,
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice14_y_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice11_y_net,
      dout => convert2_dout_net_x1
    );

  delay1: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      clr => '0',
      d => dp_ram_doutb_net_x0,
      q => delay1_q_net
    );

  delay15: entity work.delay_b6092ad150
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      clr => '0',
      d => slice40_y_net,
      q => delay15_q_net
    );

  delay17: entity work.delay_cf4f99539f
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      clr => '0',
      d => slice7_y_net,
      q => delay17_q_net_x0
    );

  delay18: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      d => bram0_data_out_net_x3,
      en => '1',
      q => delay18_q_net
    );

  delay2: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      clr => '0',
      d => delay25_q_net,
      q => delay2_q_net_x0
    );

  delay25: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      d => bram1_data_out_net_x3,
      en => '1',
      q => delay25_q_net
    );

  delay3: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      clr => '0',
      d => delay18_q_net,
      q => delay3_q_net_x0
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x855,
      clk => clk_1_sg_x855,
      clr => '0',
      d(0) => logical5_y_net,
      q(0) => delay5_q_net_x8
    );

  eq_store0_5081d49bdb: entity work.eq_store0_entity_31e887c1bd
    port map (
      ce_1 => ce_1_sg_x855,
      clk_1 => clk_1_sg_x855,
      coeff => convert_dout_net_x0,
      coeff_addr => delay17_q_net_x0,
      sync => post_sync_delay_q_net_x4,
      scale => dp_ram_doutb_net_x0
    );

  logical5: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical1_y_net_x0,
      d1(0) => logical1_y_net_x1,
      y(0) => logical5_y_net
    );

  round0_e23f403cac: entity work.round0_entity_f9fb156758
    port map (
      ce_1 => ce_1_sg_x855,
      clk_1 => clk_1_sg_x855,
      din => delay3_q_net_x0,
      scale => convert1_dout_net_x0,
      clip => logical1_y_net_x0,
      dout => concat_y_net_x2
    );

  round1_7ac64116e1: entity work.round1_entity_c520d66b3c
    port map (
      ce_1 => ce_1_sg_x855,
      clk_1 => clk_1_sg_x855,
      din => delay2_q_net_x0,
      scale => convert2_dout_net_x1,
      clip => logical1_y_net_x1,
      dout => concat_y_net_x3
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice11_y_net
    );

  slice14: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice14_y_net
    );

  slice40: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => baopoco_quant1_gain_user_data_out_net_x0,
      y => slice40_y_net
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 32,
      y_width => 10
    )
    port map (
      x => baopoco_quant1_addr_user_data_out_net_x0,
      y => slice7_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant2"

entity quant2_entity_ef9b1af5b9 is
  port (
    baopoco_quant2_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant2_gain_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    clip_out: out std_logic; 
    dout0: out std_logic_vector(7 downto 0); 
    dout1: out std_logic_vector(7 downto 0)
  );
end quant2_entity_ef9b1af5b9;

architecture structural of quant2_entity_ef9b1af5b9 is
  signal baopoco_quant2_addr_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal baopoco_quant2_gain_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal bram0_data_out_net_x3: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x3: std_logic_vector(35 downto 0);
  signal ce_1_sg_x859: std_logic;
  signal clk_1_sg_x859: std_logic;
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal concat_y_net_x3: std_logic_vector(7 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal delay15_q_net: std_logic_vector(17 downto 0);
  signal delay17_q_net_x0: std_logic_vector(9 downto 0);
  signal delay18_q_net: std_logic_vector(35 downto 0);
  signal delay1_q_net: std_logic_vector(35 downto 0);
  signal delay25_q_net: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic_vector(35 downto 0);
  signal delay3_q_net_x0: std_logic_vector(35 downto 0);
  signal delay5_q_net_x9: std_logic;
  signal dp_ram_doutb_net_x0: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical5_y_net: std_logic;
  signal post_sync_delay_q_net_x4: std_logic;
  signal slice11_y_net: std_logic_vector(17 downto 0);
  signal slice14_y_net: std_logic_vector(17 downto 0);
  signal slice40_y_net: std_logic_vector(17 downto 0);
  signal slice7_y_net: std_logic_vector(9 downto 0);

begin
  baopoco_quant2_addr_user_data_out_net_x0 <= baopoco_quant2_addr_user_data_out;
  baopoco_quant2_gain_user_data_out_net_x0 <= baopoco_quant2_gain_user_data_out;
  ce_1_sg_x859 <= ce_1;
  clk_1_sg_x859 <= clk_1;
  bram0_data_out_net_x3 <= din0;
  bram1_data_out_net_x3 <= din1;
  post_sync_delay_q_net_x4 <= sync;
  clip_out <= delay5_q_net_x9;
  dout0 <= concat_y_net_x2;
  dout1 <= concat_y_net_x3;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => delay15_q_net,
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice14_y_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice11_y_net,
      dout => convert2_dout_net_x1
    );

  delay1: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      clr => '0',
      d => dp_ram_doutb_net_x0,
      q => delay1_q_net
    );

  delay15: entity work.delay_b6092ad150
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      clr => '0',
      d => slice40_y_net,
      q => delay15_q_net
    );

  delay17: entity work.delay_cf4f99539f
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      clr => '0',
      d => slice7_y_net,
      q => delay17_q_net_x0
    );

  delay18: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      d => bram0_data_out_net_x3,
      en => '1',
      q => delay18_q_net
    );

  delay2: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      clr => '0',
      d => delay25_q_net,
      q => delay2_q_net_x0
    );

  delay25: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      d => bram1_data_out_net_x3,
      en => '1',
      q => delay25_q_net
    );

  delay3: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      clr => '0',
      d => delay18_q_net,
      q => delay3_q_net_x0
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x859,
      clk => clk_1_sg_x859,
      clr => '0',
      d(0) => logical5_y_net,
      q(0) => delay5_q_net_x9
    );

  eq_store0_72c7300121: entity work.eq_store0_entity_31e887c1bd
    port map (
      ce_1 => ce_1_sg_x859,
      clk_1 => clk_1_sg_x859,
      coeff => convert_dout_net_x0,
      coeff_addr => delay17_q_net_x0,
      sync => post_sync_delay_q_net_x4,
      scale => dp_ram_doutb_net_x0
    );

  logical5: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical1_y_net_x0,
      d1(0) => logical1_y_net_x1,
      y(0) => logical5_y_net
    );

  round0_064330d48e: entity work.round0_entity_f9fb156758
    port map (
      ce_1 => ce_1_sg_x859,
      clk_1 => clk_1_sg_x859,
      din => delay3_q_net_x0,
      scale => convert1_dout_net_x0,
      clip => logical1_y_net_x0,
      dout => concat_y_net_x2
    );

  round1_b8114eaf4f: entity work.round1_entity_c520d66b3c
    port map (
      ce_1 => ce_1_sg_x859,
      clk_1 => clk_1_sg_x859,
      din => delay2_q_net_x0,
      scale => convert2_dout_net_x1,
      clip => logical1_y_net_x1,
      dout => concat_y_net_x3
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice11_y_net
    );

  slice14: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice14_y_net
    );

  slice40: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => baopoco_quant2_gain_user_data_out_net_x0,
      y => slice40_y_net
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 32,
      y_width => 10
    )
    port map (
      x => baopoco_quant2_addr_user_data_out_net_x0,
      y => slice7_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/quant3"

entity quant3_entity_7125387a5b is
  port (
    baopoco_quant3_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant3_gain_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    din1: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    clip_out: out std_logic; 
    dout0: out std_logic_vector(7 downto 0); 
    dout1: out std_logic_vector(7 downto 0)
  );
end quant3_entity_7125387a5b;

architecture structural of quant3_entity_7125387a5b is
  signal baopoco_quant3_addr_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal baopoco_quant3_gain_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal bram0_data_out_net_x3: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x3: std_logic_vector(35 downto 0);
  signal ce_1_sg_x863: std_logic;
  signal clk_1_sg_x863: std_logic;
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal concat_y_net_x3: std_logic_vector(7 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal delay15_q_net: std_logic_vector(17 downto 0);
  signal delay17_q_net_x0: std_logic_vector(9 downto 0);
  signal delay18_q_net: std_logic_vector(35 downto 0);
  signal delay1_q_net: std_logic_vector(35 downto 0);
  signal delay25_q_net: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic_vector(35 downto 0);
  signal delay3_q_net_x0: std_logic_vector(35 downto 0);
  signal delay5_q_net_x10: std_logic;
  signal dp_ram_doutb_net_x0: std_logic_vector(35 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical5_y_net: std_logic;
  signal post_sync_delay_q_net_x4: std_logic;
  signal slice11_y_net: std_logic_vector(17 downto 0);
  signal slice14_y_net: std_logic_vector(17 downto 0);
  signal slice40_y_net: std_logic_vector(17 downto 0);
  signal slice7_y_net: std_logic_vector(9 downto 0);

begin
  baopoco_quant3_addr_user_data_out_net_x0 <= baopoco_quant3_addr_user_data_out;
  baopoco_quant3_gain_user_data_out_net_x0 <= baopoco_quant3_gain_user_data_out;
  ce_1_sg_x863 <= ce_1;
  clk_1_sg_x863 <= clk_1;
  bram0_data_out_net_x3 <= din0;
  bram1_data_out_net_x3 <= din1;
  post_sync_delay_q_net_x4 <= sync;
  clip_out <= delay5_q_net_x10;
  dout0 <= concat_y_net_x2;
  dout1 <= concat_y_net_x3;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => delay15_q_net,
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice14_y_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
      dout_bin_pt => 3,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => slice11_y_net,
      dout => convert2_dout_net_x1
    );

  delay1: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      clr => '0',
      d => dp_ram_doutb_net_x0,
      q => delay1_q_net
    );

  delay15: entity work.delay_b6092ad150
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      clr => '0',
      d => slice40_y_net,
      q => delay15_q_net
    );

  delay17: entity work.delay_cf4f99539f
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      clr => '0',
      d => slice7_y_net,
      q => delay17_q_net_x0
    );

  delay18: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      d => bram0_data_out_net_x3,
      en => '1',
      q => delay18_q_net
    );

  delay2: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      clr => '0',
      d => delay25_q_net,
      q => delay2_q_net_x0
    );

  delay25: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      d => bram1_data_out_net_x3,
      en => '1',
      q => delay25_q_net
    );

  delay3: entity work.delay_e4b9fcaf02
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      clr => '0',
      d => delay18_q_net,
      q => delay3_q_net_x0
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x863,
      clk => clk_1_sg_x863,
      clr => '0',
      d(0) => logical5_y_net,
      q(0) => delay5_q_net_x10
    );

  eq_store0_6f7dbab06b: entity work.eq_store0_entity_31e887c1bd
    port map (
      ce_1 => ce_1_sg_x863,
      clk_1 => clk_1_sg_x863,
      coeff => convert_dout_net_x0,
      coeff_addr => delay17_q_net_x0,
      sync => post_sync_delay_q_net_x4,
      scale => dp_ram_doutb_net_x0
    );

  logical5: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical1_y_net_x0,
      d1(0) => logical1_y_net_x1,
      y(0) => logical5_y_net
    );

  round0_1f6c260bc8: entity work.round0_entity_f9fb156758
    port map (
      ce_1 => ce_1_sg_x863,
      clk_1 => clk_1_sg_x863,
      din => delay3_q_net_x0,
      scale => convert1_dout_net_x0,
      clip => logical1_y_net_x0,
      dout => concat_y_net_x2
    );

  round1_9f3fc1ca18: entity work.round1_entity_c520d66b3c
    port map (
      ce_1 => ce_1_sg_x863,
      clk_1 => clk_1_sg_x863,
      din => delay2_q_net_x0,
      scale => convert2_dout_net_x1,
      clip => logical1_y_net_x1,
      dout => concat_y_net_x3
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice11_y_net
    );

  slice14: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay1_q_net,
      y => slice14_y_net
    );

  slice40: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => baopoco_quant3_gain_user_data_out_net_x0,
      y => slice40_y_net
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 32,
      y_width => 10
    )
    port map (
      x => baopoco_quant3_addr_user_data_out_net_x0,
      y => slice7_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/sync_gen/rst_gen"

entity rst_gen_entity_7cbe209cb6 is
  port (
    arm: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    mrst: out std_logic
  );
end rst_gen_entity_7cbe209cb6;

architecture structural of rst_gen_entity_7cbe209cb6 is
  signal ce_1_sg_x864: std_logic;
  signal clk_1_sg_x864: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay15_q_net_x0: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal relational_op_net_x0: std_logic;

begin
  delay15_q_net_x0 <= arm;
  ce_1_sg_x864 <= ce_1;
  clk_1_sg_x864 <= clk_1;
  logical3_y_net_x0 <= sync_in;
  mrst <= relational_op_net_x0;

  constant_x0: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_c631a46f8a19a854",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x864,
      clk => clk_1_sg_x864,
      clr => '0',
      en(0) => logical_y_net,
      rst(0) => delay15_q_net_x0,
      op => counter_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical3_y_net_x0,
      d1(0) => relational_op_net_x0,
      y(0) => logical_y_net
    );

  relational: entity work.relational_9b3c9652f3
    port map (
      a => counter_op_net,
      b => constant_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/sync_gen/sync_gen"

entity sync_gen_entity_9eece59e84 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    sync_period: in std_logic_vector(27 downto 0); 
    sync: out std_logic
  );
end sync_gen_entity_9eece59e84;

architecture structural of sync_gen_entity_9eece59e84 is
  signal ce_1_sg_x867: std_logic;
  signal clk_1_sg_x867: std_logic;
  signal constant_op_net_x0: std_logic_vector(27 downto 0);
  signal delay_q_net: std_logic;
  signal logical1_y_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x1: std_logic;
  signal relational_op_net_x0: std_logic;
  signal relational_op_net_x2: std_logic;
  signal sync_count_op_net: std_logic_vector(27 downto 0);

begin
  ce_1_sg_x867 <= ce_1;
  clk_1_sg_x867 <= clk_1;
  relational_op_net_x2 <= rst;
  constant_op_net_x0 <= sync_period;
  sync <= logical1_y_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x867,
      clk => clk_1_sg_x867,
      d(0) => relational_op_net_x2,
      en => '1',
      q(0) => delay_q_net
    );

  logical: entity work.logical_444d3f5046
    port map (
      ce => ce_1_sg_x867,
      clk => clk_1_sg_x867,
      clr => '0',
      d0(0) => delay_q_net,
      d1(0) => logical_y_net_x1,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => logical_y_net_x1,
      y(0) => logical1_y_net_x0
    );

  negedge_090b72be3b: entity work.negedge_entity_25d3f1d00b
    port map (
      ce_1 => ce_1_sg_x867,
      clk_1 => clk_1_sg_x867,
      in_x0 => relational_op_net_x2,
      out_x0 => logical_y_net_x0
    );

  posedge1_b54bcb3244: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x867,
      clk_1 => clk_1_sg_x867,
      in_x0 => relational_op_net_x0,
      out_x0 => logical_y_net_x1
    );

  relational: entity work.relational_e4a0188a91
    port map (
      a => sync_count_op_net,
      b => constant_op_net_x0,
      ce => ce_1_sg_x867,
      clk => clk_1_sg_x867,
      clr => '0',
      op(0) => relational_op_net_x0
    );

  sync_count: entity work.counter_b0e6415aa0
    port map (
      ce => ce_1_sg_x867,
      clk => clk_1_sg_x867,
      clr => '0',
      rst(0) => logical_y_net,
      op => sync_count_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco/sync_gen"

entity sync_gen_entity_2b392bb40e is
  port (
    arm: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pps: in std_logic; 
    mrst: out std_logic; 
    sync: out std_logic
  );
end sync_gen_entity_2b392bb40e;

architecture structural of sync_gen_entity_2b392bb40e is
  signal ce_1_sg_x868: std_logic;
  signal clk_1_sg_x868: std_logic;
  signal constant_op_net_x0: std_logic_vector(27 downto 0);
  signal delay15_q_net_x1: std_logic;
  signal delay1_q_net_x5: std_logic;
  signal delay2_q_net_x42: std_logic;
  signal logical1_y_net_x0: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal relational_op_net_x2: std_logic;

begin
  delay15_q_net_x1 <= arm;
  ce_1_sg_x868 <= ce_1;
  clk_1_sg_x868 <= clk_1;
  logical3_y_net_x1 <= pps;
  mrst <= delay1_q_net_x5;
  sync <= delay2_q_net_x42;

  constant_x0: entity work.constant_3afb0a580d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net_x0
    );

  delay1: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x868,
      clk => clk_1_sg_x868,
      clr => '0',
      d(0) => relational_op_net_x2,
      q(0) => delay1_q_net_x5
    );

  delay2: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x868,
      clk => clk_1_sg_x868,
      clr => '0',
      d(0) => logical1_y_net_x0,
      q(0) => delay2_q_net_x42
    );

  rst_gen_7cbe209cb6: entity work.rst_gen_entity_7cbe209cb6
    port map (
      arm => delay15_q_net_x1,
      ce_1 => ce_1_sg_x868,
      clk_1 => clk_1_sg_x868,
      sync_in => logical3_y_net_x1,
      mrst => relational_op_net_x2
    );

  sync_gen_9eece59e84: entity work.sync_gen_entity_9eece59e84
    port map (
      ce_1 => ce_1_sg_x868,
      clk_1 => clk_1_sg_x868,
      rst => relational_op_net_x2,
      sync_period => constant_op_net_x0,
      sync => logical1_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "baopoco"

entity baopoco is
  port (
    baopoco_acc_len_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_adc1_user_data_valid: in std_logic; 
    baopoco_adc1_user_datai0: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_datai1: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_datai2: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_datai3: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq0: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq1: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq2: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_dataq3: in std_logic_vector(7 downto 0); 
    baopoco_adc1_user_outofrangei0: in std_logic; 
    baopoco_adc1_user_outofrangei1: in std_logic; 
    baopoco_adc1_user_outofrangeq0: in std_logic; 
    baopoco_adc1_user_outofrangeq1: in std_logic; 
    baopoco_adc1_user_sync0: in std_logic; 
    baopoco_adc1_user_sync1: in std_logic; 
    baopoco_adc1_user_sync2: in std_logic; 
    baopoco_adc1_user_sync3: in std_logic; 
    baopoco_adc_user_data_valid: in std_logic; 
    baopoco_adc_user_datai0: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_datai1: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_datai2: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_datai3: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq0: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq1: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq2: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_dataq3: in std_logic_vector(7 downto 0); 
    baopoco_adc_user_outofrangei0: in std_logic; 
    baopoco_adc_user_outofrangei1: in std_logic; 
    baopoco_adc_user_outofrangeq0: in std_logic; 
    baopoco_adc_user_outofrangeq1: in std_logic; 
    baopoco_adc_user_sync0: in std_logic; 
    baopoco_adc_user_sync1: in std_logic; 
    baopoco_adc_user_sync2: in std_logic; 
    baopoco_adc_user_sync3: in std_logic; 
    baopoco_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa1_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa2_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa3_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ab_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ab_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac1_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac1_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac2_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac2_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac3_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac3_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ad_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ad_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa1_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa2_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa3_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ab_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ab_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac1_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac1_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac2_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac2_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac3_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac3_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ad_imag_data_out: in std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ad_real_data_out: in std_logic_vector(31 downto 0); 
    baopoco_fft_shift_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant0_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant0_gain_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant1_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant1_gain_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant2_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant2_gain_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant3_addr_user_data_out: in std_logic_vector(31 downto 0); 
    baopoco_quant3_gain_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    baopoco_acc_num_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum0_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum1_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum2_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum3_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum_sq0_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum_sq1_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum_sq2_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_adc_sum_sq3_user_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa1_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_aa1_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa1_real_we: out std_logic; 
    baopoco_dir_x0_aa2_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_aa2_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa2_real_we: out std_logic; 
    baopoco_dir_x0_aa3_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_aa3_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa3_real_we: out std_logic; 
    baopoco_dir_x0_aa_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_aa_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_aa_real_we: out std_logic; 
    baopoco_dir_x0_ab_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ab_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ab_imag_we: out std_logic; 
    baopoco_dir_x0_ab_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ab_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ab_real_we: out std_logic; 
    baopoco_dir_x0_ac1_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac1_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac1_imag_we: out std_logic; 
    baopoco_dir_x0_ac1_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac1_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac1_real_we: out std_logic; 
    baopoco_dir_x0_ac2_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac2_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac2_imag_we: out std_logic; 
    baopoco_dir_x0_ac2_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac2_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac2_real_we: out std_logic; 
    baopoco_dir_x0_ac3_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac3_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac3_imag_we: out std_logic; 
    baopoco_dir_x0_ac3_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac3_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac3_real_we: out std_logic; 
    baopoco_dir_x0_ac_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac_imag_we: out std_logic; 
    baopoco_dir_x0_ac_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ac_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ac_real_we: out std_logic; 
    baopoco_dir_x0_ad_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ad_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ad_imag_we: out std_logic; 
    baopoco_dir_x0_ad_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x0_ad_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x0_ad_real_we: out std_logic; 
    baopoco_dir_x1_aa1_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_aa1_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa1_real_we: out std_logic; 
    baopoco_dir_x1_aa2_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_aa2_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa2_real_we: out std_logic; 
    baopoco_dir_x1_aa3_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_aa3_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa3_real_we: out std_logic; 
    baopoco_dir_x1_aa_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_aa_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_aa_real_we: out std_logic; 
    baopoco_dir_x1_ab_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ab_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ab_imag_we: out std_logic; 
    baopoco_dir_x1_ab_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ab_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ab_real_we: out std_logic; 
    baopoco_dir_x1_ac1_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac1_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac1_imag_we: out std_logic; 
    baopoco_dir_x1_ac1_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac1_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac1_real_we: out std_logic; 
    baopoco_dir_x1_ac2_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac2_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac2_imag_we: out std_logic; 
    baopoco_dir_x1_ac2_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac2_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac2_real_we: out std_logic; 
    baopoco_dir_x1_ac3_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac3_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac3_imag_we: out std_logic; 
    baopoco_dir_x1_ac3_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac3_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac3_real_we: out std_logic; 
    baopoco_dir_x1_ac_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac_imag_we: out std_logic; 
    baopoco_dir_x1_ac_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ac_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ac_real_we: out std_logic; 
    baopoco_dir_x1_ad_imag_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ad_imag_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ad_imag_we: out std_logic; 
    baopoco_dir_x1_ad_real_addr: out std_logic_vector(9 downto 0); 
    baopoco_dir_x1_ad_real_data_in: out std_logic_vector(31 downto 0); 
    baopoco_dir_x1_ad_real_we: out std_logic; 
    baopoco_led0_adc_clip_gateway: out std_logic; 
    baopoco_led1_mrst_gateway: out std_logic; 
    baopoco_led2_sync_gateway: out std_logic; 
    baopoco_led3_new_acc_gateway: out std_logic; 
    baopoco_status_user_data_in: out std_logic_vector(31 downto 0); 
    gateway_out: out std_logic_vector(8 downto 0); 
    gateway_out1: out std_logic_vector(31 downto 0); 
    gateway_out1_x0: out std_logic_vector(31 downto 0); 
    gateway_out1_x1: out std_logic_vector(31 downto 0); 
    gateway_out1_x2: out std_logic_vector(31 downto 0); 
    gateway_out1_x3: out std_logic_vector(31 downto 0); 
    gateway_out1_x4: out std_logic_vector(31 downto 0); 
    gateway_out1_x5: out std_logic_vector(31 downto 0); 
    gateway_out1_x6: out std_logic_vector(31 downto 0); 
    gateway_out2: out std_logic; 
    gateway_out2_x0: out std_logic; 
    gateway_out2_x1: out std_logic; 
    gateway_out2_x2: out std_logic; 
    gateway_out2_x3: out std_logic; 
    gateway_out2_x4: out std_logic; 
    gateway_out2_x5: out std_logic; 
    gateway_out2_x6: out std_logic; 
    gateway_out3: out std_logic; 
    gateway_out3_x0: out std_logic; 
    gateway_out3_x1: out std_logic; 
    gateway_out3_x2: out std_logic; 
    gateway_out3_x3: out std_logic; 
    gateway_out3_x4: out std_logic; 
    gateway_out3_x5: out std_logic; 
    gateway_out3_x6: out std_logic; 
    gateway_out_x0: out std_logic_vector(8 downto 0); 
    gateway_out_x1: out std_logic_vector(8 downto 0); 
    gateway_out_x2: out std_logic_vector(8 downto 0); 
    gateway_out_x3: out std_logic_vector(8 downto 0); 
    gateway_out_x4: out std_logic_vector(8 downto 0); 
    gateway_out_x5: out std_logic_vector(8 downto 0); 
    gateway_out_x6: out std_logic_vector(8 downto 0)
  );
end baopoco;

architecture structural of baopoco is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "baopoco,sysgen_core_11_5,{total_blocks=15882,xilinx_accumulator_block=8,xilinx_adder_subtracter_block=480,xilinx_arithmetic_relational_operator_block=239,xilinx_assert_block=8,xilinx_binary_shift_operator_block=17,xilinx_bit_slice_extractor_block=1224,xilinx_bus_concatenator_block=435,xilinx_bus_multiplexer_block=392,xilinx_constant_block_block=927,xilinx_counter_block=308,xilinx_delay_block=733,xilinx_disregard_subsystem_for_generation_block=32,xilinx_dual_port_random_access_memory_block=4,xilinx_gateway_in_block=173,xilinx_gateway_out_block=174,xilinx_input_scaler_block=160,xilinx_inverter_block=452,xilinx_logical_block_block=686,xilinx_multiplier_block=164,xilinx_negate_block_block=20,xilinx_register_block=49,xilinx_resource_estimator_block=20,xilinx_single_port_random_access_memory_block=144,xilinx_single_port_read_only_memory_block=204,xilinx_system_generator_block=1,xilinx_type_converter_block=370,xilinx_type_reinterpreter_block=1348,}";

  signal baopoco_acc_len_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_acc_num_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc1_user_data_valid_net: std_logic;
  signal baopoco_adc1_user_datai0_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_datai1_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_datai2_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_datai3_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq0_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq1_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq2_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_dataq3_net: std_logic_vector(7 downto 0);
  signal baopoco_adc1_user_outofrangei0_net: std_logic;
  signal baopoco_adc1_user_outofrangei1_net: std_logic;
  signal baopoco_adc1_user_outofrangeq0_net: std_logic;
  signal baopoco_adc1_user_outofrangeq1_net: std_logic;
  signal baopoco_adc1_user_sync0_net: std_logic;
  signal baopoco_adc1_user_sync1_net: std_logic;
  signal baopoco_adc1_user_sync2_net: std_logic;
  signal baopoco_adc1_user_sync3_net: std_logic;
  signal baopoco_adc_sum0_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum1_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum2_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum3_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum_sq0_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum_sq1_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum_sq2_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_sum_sq3_user_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_adc_user_data_valid_net: std_logic;
  signal baopoco_adc_user_datai0_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_datai1_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_datai2_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_datai3_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq0_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq1_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq2_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_dataq3_net: std_logic_vector(7 downto 0);
  signal baopoco_adc_user_outofrangei0_net: std_logic;
  signal baopoco_adc_user_outofrangei1_net: std_logic;
  signal baopoco_adc_user_outofrangeq0_net: std_logic;
  signal baopoco_adc_user_outofrangeq1_net: std_logic;
  signal baopoco_adc_user_sync0_net: std_logic;
  signal baopoco_adc_user_sync1_net: std_logic;
  signal baopoco_adc_user_sync2_net: std_logic;
  signal baopoco_adc_user_sync3_net: std_logic;
  signal baopoco_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa1_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_aa1_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa1_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa1_real_we_net: std_logic;
  signal baopoco_dir_x0_aa2_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_aa2_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa2_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa2_real_we_net: std_logic;
  signal baopoco_dir_x0_aa3_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_aa3_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa3_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa3_real_we_net: std_logic;
  signal baopoco_dir_x0_aa_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_aa_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_aa_real_we_net: std_logic;
  signal baopoco_dir_x0_ab_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ab_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ab_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ab_imag_we_net: std_logic;
  signal baopoco_dir_x0_ab_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ab_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ab_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ab_real_we_net: std_logic;
  signal baopoco_dir_x0_ac1_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac1_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac1_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac1_imag_we_net: std_logic;
  signal baopoco_dir_x0_ac1_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac1_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac1_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac1_real_we_net: std_logic;
  signal baopoco_dir_x0_ac2_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac2_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac2_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac2_imag_we_net: std_logic;
  signal baopoco_dir_x0_ac2_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac2_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac2_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac2_real_we_net: std_logic;
  signal baopoco_dir_x0_ac3_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac3_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac3_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac3_imag_we_net: std_logic;
  signal baopoco_dir_x0_ac3_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac3_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac3_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac3_real_we_net: std_logic;
  signal baopoco_dir_x0_ac_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac_imag_we_net: std_logic;
  signal baopoco_dir_x0_ac_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ac_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ac_real_we_net: std_logic;
  signal baopoco_dir_x0_ad_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ad_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ad_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ad_imag_we_net: std_logic;
  signal baopoco_dir_x0_ad_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x0_ad_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ad_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x0_ad_real_we_net: std_logic;
  signal baopoco_dir_x1_aa1_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_aa1_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa1_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa1_real_we_net: std_logic;
  signal baopoco_dir_x1_aa2_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_aa2_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa2_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa2_real_we_net: std_logic;
  signal baopoco_dir_x1_aa3_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_aa3_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa3_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa3_real_we_net: std_logic;
  signal baopoco_dir_x1_aa_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_aa_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_aa_real_we_net: std_logic;
  signal baopoco_dir_x1_ab_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ab_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ab_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ab_imag_we_net: std_logic;
  signal baopoco_dir_x1_ab_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ab_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ab_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ab_real_we_net: std_logic;
  signal baopoco_dir_x1_ac1_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac1_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac1_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac1_imag_we_net: std_logic;
  signal baopoco_dir_x1_ac1_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac1_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac1_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac1_real_we_net: std_logic;
  signal baopoco_dir_x1_ac2_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac2_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac2_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac2_imag_we_net: std_logic;
  signal baopoco_dir_x1_ac2_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac2_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac2_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac2_real_we_net: std_logic;
  signal baopoco_dir_x1_ac3_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac3_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac3_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac3_imag_we_net: std_logic;
  signal baopoco_dir_x1_ac3_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac3_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac3_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac3_real_we_net: std_logic;
  signal baopoco_dir_x1_ac_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac_imag_we_net: std_logic;
  signal baopoco_dir_x1_ac_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ac_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ac_real_we_net: std_logic;
  signal baopoco_dir_x1_ad_imag_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ad_imag_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ad_imag_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ad_imag_we_net: std_logic;
  signal baopoco_dir_x1_ad_real_addr_net: std_logic_vector(9 downto 0);
  signal baopoco_dir_x1_ad_real_data_in_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ad_real_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_dir_x1_ad_real_we_net: std_logic;
  signal baopoco_fft_shift_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_led0_adc_clip_gateway_net: std_logic;
  signal baopoco_led1_mrst_gateway_net: std_logic;
  signal baopoco_led2_sync_gateway_net: std_logic;
  signal baopoco_led3_new_acc_gateway_net: std_logic;
  signal baopoco_quant0_addr_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant0_gain_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant1_addr_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant1_gain_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant2_addr_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant2_gain_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant3_addr_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_quant3_gain_user_data_out_net: std_logic_vector(31 downto 0);
  signal baopoco_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal bram0_data_out_net_x3: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x4: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x5: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x6: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x3: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x4: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x5: std_logic_vector(35 downto 0);
  signal bram1_data_out_net_x6: std_logic_vector(35 downto 0);
  signal ce_1_sg_x869: std_logic;
  signal clk_1_sg_x869: std_logic;
  signal concat1_y_net_x1: std_logic_vector(31 downto 0);
  signal concat3_y_net_x0: std_logic_vector(31 downto 0);
  signal concat3_y_net_x1: std_logic_vector(31 downto 0);
  signal concat3_y_net_x2: std_logic_vector(31 downto 0);
  signal concat3_y_net_x3: std_logic_vector(31 downto 0);
  signal concat6_y_net: std_logic_vector(31 downto 0);
  signal concat7_y_net: std_logic_vector(31 downto 0);
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal concat_y_net_x3: std_logic_vector(7 downto 0);
  signal concat_y_net_x4: std_logic_vector(7 downto 0);
  signal concat_y_net_x5: std_logic_vector(7 downto 0);
  signal concat_y_net_x6: std_logic_vector(7 downto 0);
  signal concat_y_net_x7: std_logic_vector(7 downto 0);
  signal concat_y_net_x8: std_logic_vector(7 downto 0);
  signal concat_y_net_x9: std_logic_vector(7 downto 0);
  signal constant10_op_net_x0: std_logic;
  signal constant12_op_net_x0: std_logic;
  signal constant13_op_net_x0: std_logic;
  signal constant14_op_net_x0: std_logic;
  signal constant15_op_net_x0: std_logic;
  signal constant16_op_net_x0: std_logic;
  signal constant17_op_net_x0: std_logic;
  signal constant18_op_net_x0: std_logic;
  signal constant19_op_net_x0: std_logic;
  signal constant20_op_net_x0: std_logic;
  signal constant21_op_net_x0: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal constant4_op_net_x0: std_logic;
  signal constant5_op_net_x0: std_logic;
  signal constant6_op_net_x0: std_logic;
  signal constant7_op_net_x0: std_logic;
  signal constant8_op_net_x0: std_logic;
  signal convert1_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert1_dout_net_x2: std_logic_vector(31 downto 0);
  signal convert1_dout_net_x3: std_logic_vector(31 downto 0);
  signal convert1_dout_net_x4: std_logic_vector(31 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(23 downto 0);
  signal convert2_dout_net_x2: std_logic_vector(23 downto 0);
  signal convert2_dout_net_x3: std_logic_vector(23 downto 0);
  signal convert2_dout_net_x4: std_logic_vector(23 downto 0);
  signal convert_1_1_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_1_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_1_1_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_1_1_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_1_2_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_2_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_1_2_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_1_2_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_1_3_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_3_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_1_3_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_1_3_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_1_4_dout_net_x1: std_logic_vector(17 downto 0);
  signal convert_1_4_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_1_4_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_1_4_dout_net_x4: std_logic_vector(17 downto 0);
  signal counter1_op_net_x0: std_logic_vector(31 downto 0);
  signal delay10_q_net_x1: std_logic_vector(31 downto 0);
  signal delay11_q_net_x1: std_logic_vector(31 downto 0);
  signal delay12_q_net_x0: std_logic;
  signal delay13_q_net_x0: std_logic;
  signal delay14_q_net: std_logic;
  signal delay15_q_net_x1: std_logic;
  signal delay16_q_net_x0: std_logic;
  signal delay1_q_net_x1: std_logic_vector(31 downto 0);
  signal delay1_q_net_x2: std_logic;
  signal delay1_q_net_x3: std_logic;
  signal delay1_q_net_x4: std_logic;
  signal delay1_q_net_x5: std_logic;
  signal delay1_q_net_x6: std_logic;
  signal delay20_q_net: std_logic_vector(31 downto 0);
  signal delay21_q_net: std_logic_vector(31 downto 0);
  signal delay2_q_net_x2: std_logic;
  signal delay2_q_net_x42: std_logic;
  signal delay3_q_net: std_logic;
  signal delay4_q_net: std_logic;
  signal delay4_q_net_x1: std_logic;
  signal delay5_q_net_x10: std_logic;
  signal delay5_q_net_x11: std_logic;
  signal delay5_q_net_x7: std_logic;
  signal delay5_q_net_x8: std_logic;
  signal delay5_q_net_x9: std_logic;
  signal delay6_q_net_x10: std_logic;
  signal delay7_q_net_x10: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal delay9_q_net: std_logic;
  signal delay_q_net_x1: std_logic_vector(31 downto 0);
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x7: std_logic;
  signal delay_q_net_x8: std_logic;
  signal gateway_out1_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x0_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x1_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x2_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x3_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x4_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x5_net: std_logic_vector(31 downto 0);
  signal gateway_out1_x6_net: std_logic_vector(31 downto 0);
  signal gateway_out2_net: std_logic;
  signal gateway_out2_x0_net: std_logic;
  signal gateway_out2_x1_net: std_logic;
  signal gateway_out2_x2_net: std_logic;
  signal gateway_out2_x3_net: std_logic;
  signal gateway_out2_x4_net: std_logic;
  signal gateway_out2_x5_net: std_logic;
  signal gateway_out2_x6_net: std_logic;
  signal gateway_out3_net: std_logic;
  signal gateway_out3_x0_net: std_logic;
  signal gateway_out3_x1_net: std_logic;
  signal gateway_out3_x2_net: std_logic;
  signal gateway_out3_x3_net: std_logic;
  signal gateway_out3_x4_net: std_logic;
  signal gateway_out3_x5_net: std_logic;
  signal gateway_out3_x6_net: std_logic;
  signal gateway_out_net: std_logic_vector(8 downto 0);
  signal gateway_out_x0_net: std_logic_vector(8 downto 0);
  signal gateway_out_x1_net: std_logic_vector(8 downto 0);
  signal gateway_out_x2_net: std_logic_vector(8 downto 0);
  signal gateway_out_x3_net: std_logic_vector(8 downto 0);
  signal gateway_out_x4_net: std_logic_vector(8 downto 0);
  signal gateway_out_x5_net: std_logic_vector(8 downto 0);
  signal gateway_out_x6_net: std_logic_vector(8 downto 0);
  signal inverter1_op_net_x0: std_logic;
  signal inverter2_op_net_x0: std_logic;
  signal inverter3_op_net_x0: std_logic;
  signal inverter_op_net_x0: std_logic;
  signal logical1_y_net: std_logic;
  signal logical2_y_net: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical4_y_net_x1: std_logic;
  signal logical6_y_net: std_logic;
  signal logical8_y_net: std_logic;
  signal logical9_y_net: std_logic;
  signal logical_y_net: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x1: std_logic;
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal logical_y_net_x4: std_logic;
  signal logical_y_net_x5: std_logic;
  signal of_or_y_net_x4: std_logic;
  signal of_or_y_net_x5: std_logic;
  signal of_or_y_net_x6: std_logic;
  signal of_or_y_net_x7: std_logic;
  signal post_sync_delay_q_net_x4: std_logic;
  signal post_sync_delay_q_net_x5: std_logic;
  signal post_sync_delay_q_net_x6: std_logic;
  signal post_sync_delay_q_net_x7: std_logic;
  signal reinterpret1_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x7: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret1_output_port_net_x9: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x7: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net_x9: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x7: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net_x9: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net_x2: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x16: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x17: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x18: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x19: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x20: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x21: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x22: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x23: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x24: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x25: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x26: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x27: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x28: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x29: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x30: std_logic_vector(7 downto 0);
  signal relational5_op_net_x0: std_logic;
  signal relational5_op_net_x15: std_logic;
  signal shift1_op_net_x3: std_logic_vector(17 downto 0);
  signal shift1_op_net_x4: std_logic_vector(17 downto 0);
  signal shift1_op_net_x5: std_logic_vector(17 downto 0);
  signal shift1_op_net_x6: std_logic_vector(17 downto 0);
  signal shift2_op_net_x3: std_logic_vector(17 downto 0);
  signal shift2_op_net_x4: std_logic_vector(17 downto 0);
  signal shift2_op_net_x5: std_logic_vector(17 downto 0);
  signal shift2_op_net_x6: std_logic_vector(17 downto 0);
  signal shift3_op_net_x3: std_logic_vector(17 downto 0);
  signal shift3_op_net_x4: std_logic_vector(17 downto 0);
  signal shift3_op_net_x5: std_logic_vector(17 downto 0);
  signal shift3_op_net_x6: std_logic_vector(17 downto 0);
  signal shift4_op_net_x3: std_logic_vector(17 downto 0);
  signal shift4_op_net_x4: std_logic_vector(17 downto 0);
  signal shift4_op_net_x5: std_logic_vector(17 downto 0);
  signal shift4_op_net_x6: std_logic_vector(17 downto 0);
  signal slice12_y_net_x9: std_logic_vector(7 downto 0);
  signal slice13_y_net_x9: std_logic_vector(7 downto 0);
  signal slice15_y_net_x9: std_logic_vector(7 downto 0);
  signal slice20_y_net_x9: std_logic_vector(7 downto 0);
  signal slice26_y_net_x0: std_logic;
  signal slice31_y_net_x0: std_logic;
  signal slice32_y_net_x0: std_logic;
  signal slice36_y_net_x9: std_logic_vector(7 downto 0);
  signal slice37_y_net_x9: std_logic_vector(7 downto 0);
  signal slice38_y_net_x9: std_logic_vector(7 downto 0);
  signal slice39_y_net_x9: std_logic_vector(7 downto 0);
  signal slice6_y_net_x23: std_logic_vector(12 downto 0);

begin
  baopoco_acc_len_user_data_out_net <= baopoco_acc_len_user_data_out;
  baopoco_adc1_user_data_valid_net <= baopoco_adc1_user_data_valid;
  baopoco_adc1_user_datai0_net <= baopoco_adc1_user_datai0;
  baopoco_adc1_user_datai1_net <= baopoco_adc1_user_datai1;
  baopoco_adc1_user_datai2_net <= baopoco_adc1_user_datai2;
  baopoco_adc1_user_datai3_net <= baopoco_adc1_user_datai3;
  baopoco_adc1_user_dataq0_net <= baopoco_adc1_user_dataq0;
  baopoco_adc1_user_dataq1_net <= baopoco_adc1_user_dataq1;
  baopoco_adc1_user_dataq2_net <= baopoco_adc1_user_dataq2;
  baopoco_adc1_user_dataq3_net <= baopoco_adc1_user_dataq3;
  baopoco_adc1_user_outofrangei0_net <= baopoco_adc1_user_outofrangei0;
  baopoco_adc1_user_outofrangei1_net <= baopoco_adc1_user_outofrangei1;
  baopoco_adc1_user_outofrangeq0_net <= baopoco_adc1_user_outofrangeq0;
  baopoco_adc1_user_outofrangeq1_net <= baopoco_adc1_user_outofrangeq1;
  baopoco_adc1_user_sync0_net <= baopoco_adc1_user_sync0;
  baopoco_adc1_user_sync1_net <= baopoco_adc1_user_sync1;
  baopoco_adc1_user_sync2_net <= baopoco_adc1_user_sync2;
  baopoco_adc1_user_sync3_net <= baopoco_adc1_user_sync3;
  baopoco_adc_user_data_valid_net <= baopoco_adc_user_data_valid;
  baopoco_adc_user_datai0_net <= baopoco_adc_user_datai0;
  baopoco_adc_user_datai1_net <= baopoco_adc_user_datai1;
  baopoco_adc_user_datai2_net <= baopoco_adc_user_datai2;
  baopoco_adc_user_datai3_net <= baopoco_adc_user_datai3;
  baopoco_adc_user_dataq0_net <= baopoco_adc_user_dataq0;
  baopoco_adc_user_dataq1_net <= baopoco_adc_user_dataq1;
  baopoco_adc_user_dataq2_net <= baopoco_adc_user_dataq2;
  baopoco_adc_user_dataq3_net <= baopoco_adc_user_dataq3;
  baopoco_adc_user_outofrangei0_net <= baopoco_adc_user_outofrangei0;
  baopoco_adc_user_outofrangei1_net <= baopoco_adc_user_outofrangei1;
  baopoco_adc_user_outofrangeq0_net <= baopoco_adc_user_outofrangeq0;
  baopoco_adc_user_outofrangeq1_net <= baopoco_adc_user_outofrangeq1;
  baopoco_adc_user_sync0_net <= baopoco_adc_user_sync0;
  baopoco_adc_user_sync1_net <= baopoco_adc_user_sync1;
  baopoco_adc_user_sync2_net <= baopoco_adc_user_sync2;
  baopoco_adc_user_sync3_net <= baopoco_adc_user_sync3;
  baopoco_ctrl_user_data_out_net <= baopoco_ctrl_user_data_out;
  baopoco_dir_x0_aa1_real_data_out_net <= baopoco_dir_x0_aa1_real_data_out;
  baopoco_dir_x0_aa2_real_data_out_net <= baopoco_dir_x0_aa2_real_data_out;
  baopoco_dir_x0_aa3_real_data_out_net <= baopoco_dir_x0_aa3_real_data_out;
  baopoco_dir_x0_aa_real_data_out_net <= baopoco_dir_x0_aa_real_data_out;
  baopoco_dir_x0_ab_imag_data_out_net <= baopoco_dir_x0_ab_imag_data_out;
  baopoco_dir_x0_ab_real_data_out_net <= baopoco_dir_x0_ab_real_data_out;
  baopoco_dir_x0_ac1_imag_data_out_net <= baopoco_dir_x0_ac1_imag_data_out;
  baopoco_dir_x0_ac1_real_data_out_net <= baopoco_dir_x0_ac1_real_data_out;
  baopoco_dir_x0_ac2_imag_data_out_net <= baopoco_dir_x0_ac2_imag_data_out;
  baopoco_dir_x0_ac2_real_data_out_net <= baopoco_dir_x0_ac2_real_data_out;
  baopoco_dir_x0_ac3_imag_data_out_net <= baopoco_dir_x0_ac3_imag_data_out;
  baopoco_dir_x0_ac3_real_data_out_net <= baopoco_dir_x0_ac3_real_data_out;
  baopoco_dir_x0_ac_imag_data_out_net <= baopoco_dir_x0_ac_imag_data_out;
  baopoco_dir_x0_ac_real_data_out_net <= baopoco_dir_x0_ac_real_data_out;
  baopoco_dir_x0_ad_imag_data_out_net <= baopoco_dir_x0_ad_imag_data_out;
  baopoco_dir_x0_ad_real_data_out_net <= baopoco_dir_x0_ad_real_data_out;
  baopoco_dir_x1_aa1_real_data_out_net <= baopoco_dir_x1_aa1_real_data_out;
  baopoco_dir_x1_aa2_real_data_out_net <= baopoco_dir_x1_aa2_real_data_out;
  baopoco_dir_x1_aa3_real_data_out_net <= baopoco_dir_x1_aa3_real_data_out;
  baopoco_dir_x1_aa_real_data_out_net <= baopoco_dir_x1_aa_real_data_out;
  baopoco_dir_x1_ab_imag_data_out_net <= baopoco_dir_x1_ab_imag_data_out;
  baopoco_dir_x1_ab_real_data_out_net <= baopoco_dir_x1_ab_real_data_out;
  baopoco_dir_x1_ac1_imag_data_out_net <= baopoco_dir_x1_ac1_imag_data_out;
  baopoco_dir_x1_ac1_real_data_out_net <= baopoco_dir_x1_ac1_real_data_out;
  baopoco_dir_x1_ac2_imag_data_out_net <= baopoco_dir_x1_ac2_imag_data_out;
  baopoco_dir_x1_ac2_real_data_out_net <= baopoco_dir_x1_ac2_real_data_out;
  baopoco_dir_x1_ac3_imag_data_out_net <= baopoco_dir_x1_ac3_imag_data_out;
  baopoco_dir_x1_ac3_real_data_out_net <= baopoco_dir_x1_ac3_real_data_out;
  baopoco_dir_x1_ac_imag_data_out_net <= baopoco_dir_x1_ac_imag_data_out;
  baopoco_dir_x1_ac_real_data_out_net <= baopoco_dir_x1_ac_real_data_out;
  baopoco_dir_x1_ad_imag_data_out_net <= baopoco_dir_x1_ad_imag_data_out;
  baopoco_dir_x1_ad_real_data_out_net <= baopoco_dir_x1_ad_real_data_out;
  baopoco_fft_shift_user_data_out_net <= baopoco_fft_shift_user_data_out;
  baopoco_quant0_addr_user_data_out_net <= baopoco_quant0_addr_user_data_out;
  baopoco_quant0_gain_user_data_out_net <= baopoco_quant0_gain_user_data_out;
  baopoco_quant1_addr_user_data_out_net <= baopoco_quant1_addr_user_data_out;
  baopoco_quant1_gain_user_data_out_net <= baopoco_quant1_gain_user_data_out;
  baopoco_quant2_addr_user_data_out_net <= baopoco_quant2_addr_user_data_out;
  baopoco_quant2_gain_user_data_out_net <= baopoco_quant2_gain_user_data_out;
  baopoco_quant3_addr_user_data_out_net <= baopoco_quant3_addr_user_data_out;
  baopoco_quant3_gain_user_data_out_net <= baopoco_quant3_gain_user_data_out;
  ce_1_sg_x869 <= ce_1;
  clk_1_sg_x869 <= clk_1;
  baopoco_acc_num_user_data_in <= baopoco_acc_num_user_data_in_net;
  baopoco_adc_sum0_user_data_in <= baopoco_adc_sum0_user_data_in_net;
  baopoco_adc_sum1_user_data_in <= baopoco_adc_sum1_user_data_in_net;
  baopoco_adc_sum2_user_data_in <= baopoco_adc_sum2_user_data_in_net;
  baopoco_adc_sum3_user_data_in <= baopoco_adc_sum3_user_data_in_net;
  baopoco_adc_sum_sq0_user_data_in <= baopoco_adc_sum_sq0_user_data_in_net;
  baopoco_adc_sum_sq1_user_data_in <= baopoco_adc_sum_sq1_user_data_in_net;
  baopoco_adc_sum_sq2_user_data_in <= baopoco_adc_sum_sq2_user_data_in_net;
  baopoco_adc_sum_sq3_user_data_in <= baopoco_adc_sum_sq3_user_data_in_net;
  baopoco_dir_x0_aa1_real_addr <= baopoco_dir_x0_aa1_real_addr_net;
  baopoco_dir_x0_aa1_real_data_in <= baopoco_dir_x0_aa1_real_data_in_net;
  baopoco_dir_x0_aa1_real_we <= baopoco_dir_x0_aa1_real_we_net;
  baopoco_dir_x0_aa2_real_addr <= baopoco_dir_x0_aa2_real_addr_net;
  baopoco_dir_x0_aa2_real_data_in <= baopoco_dir_x0_aa2_real_data_in_net;
  baopoco_dir_x0_aa2_real_we <= baopoco_dir_x0_aa2_real_we_net;
  baopoco_dir_x0_aa3_real_addr <= baopoco_dir_x0_aa3_real_addr_net;
  baopoco_dir_x0_aa3_real_data_in <= baopoco_dir_x0_aa3_real_data_in_net;
  baopoco_dir_x0_aa3_real_we <= baopoco_dir_x0_aa3_real_we_net;
  baopoco_dir_x0_aa_real_addr <= baopoco_dir_x0_aa_real_addr_net;
  baopoco_dir_x0_aa_real_data_in <= baopoco_dir_x0_aa_real_data_in_net;
  baopoco_dir_x0_aa_real_we <= baopoco_dir_x0_aa_real_we_net;
  baopoco_dir_x0_ab_imag_addr <= baopoco_dir_x0_ab_imag_addr_net;
  baopoco_dir_x0_ab_imag_data_in <= baopoco_dir_x0_ab_imag_data_in_net;
  baopoco_dir_x0_ab_imag_we <= baopoco_dir_x0_ab_imag_we_net;
  baopoco_dir_x0_ab_real_addr <= baopoco_dir_x0_ab_real_addr_net;
  baopoco_dir_x0_ab_real_data_in <= baopoco_dir_x0_ab_real_data_in_net;
  baopoco_dir_x0_ab_real_we <= baopoco_dir_x0_ab_real_we_net;
  baopoco_dir_x0_ac1_imag_addr <= baopoco_dir_x0_ac1_imag_addr_net;
  baopoco_dir_x0_ac1_imag_data_in <= baopoco_dir_x0_ac1_imag_data_in_net;
  baopoco_dir_x0_ac1_imag_we <= baopoco_dir_x0_ac1_imag_we_net;
  baopoco_dir_x0_ac1_real_addr <= baopoco_dir_x0_ac1_real_addr_net;
  baopoco_dir_x0_ac1_real_data_in <= baopoco_dir_x0_ac1_real_data_in_net;
  baopoco_dir_x0_ac1_real_we <= baopoco_dir_x0_ac1_real_we_net;
  baopoco_dir_x0_ac2_imag_addr <= baopoco_dir_x0_ac2_imag_addr_net;
  baopoco_dir_x0_ac2_imag_data_in <= baopoco_dir_x0_ac2_imag_data_in_net;
  baopoco_dir_x0_ac2_imag_we <= baopoco_dir_x0_ac2_imag_we_net;
  baopoco_dir_x0_ac2_real_addr <= baopoco_dir_x0_ac2_real_addr_net;
  baopoco_dir_x0_ac2_real_data_in <= baopoco_dir_x0_ac2_real_data_in_net;
  baopoco_dir_x0_ac2_real_we <= baopoco_dir_x0_ac2_real_we_net;
  baopoco_dir_x0_ac3_imag_addr <= baopoco_dir_x0_ac3_imag_addr_net;
  baopoco_dir_x0_ac3_imag_data_in <= baopoco_dir_x0_ac3_imag_data_in_net;
  baopoco_dir_x0_ac3_imag_we <= baopoco_dir_x0_ac3_imag_we_net;
  baopoco_dir_x0_ac3_real_addr <= baopoco_dir_x0_ac3_real_addr_net;
  baopoco_dir_x0_ac3_real_data_in <= baopoco_dir_x0_ac3_real_data_in_net;
  baopoco_dir_x0_ac3_real_we <= baopoco_dir_x0_ac3_real_we_net;
  baopoco_dir_x0_ac_imag_addr <= baopoco_dir_x0_ac_imag_addr_net;
  baopoco_dir_x0_ac_imag_data_in <= baopoco_dir_x0_ac_imag_data_in_net;
  baopoco_dir_x0_ac_imag_we <= baopoco_dir_x0_ac_imag_we_net;
  baopoco_dir_x0_ac_real_addr <= baopoco_dir_x0_ac_real_addr_net;
  baopoco_dir_x0_ac_real_data_in <= baopoco_dir_x0_ac_real_data_in_net;
  baopoco_dir_x0_ac_real_we <= baopoco_dir_x0_ac_real_we_net;
  baopoco_dir_x0_ad_imag_addr <= baopoco_dir_x0_ad_imag_addr_net;
  baopoco_dir_x0_ad_imag_data_in <= baopoco_dir_x0_ad_imag_data_in_net;
  baopoco_dir_x0_ad_imag_we <= baopoco_dir_x0_ad_imag_we_net;
  baopoco_dir_x0_ad_real_addr <= baopoco_dir_x0_ad_real_addr_net;
  baopoco_dir_x0_ad_real_data_in <= baopoco_dir_x0_ad_real_data_in_net;
  baopoco_dir_x0_ad_real_we <= baopoco_dir_x0_ad_real_we_net;
  baopoco_dir_x1_aa1_real_addr <= baopoco_dir_x1_aa1_real_addr_net;
  baopoco_dir_x1_aa1_real_data_in <= baopoco_dir_x1_aa1_real_data_in_net;
  baopoco_dir_x1_aa1_real_we <= baopoco_dir_x1_aa1_real_we_net;
  baopoco_dir_x1_aa2_real_addr <= baopoco_dir_x1_aa2_real_addr_net;
  baopoco_dir_x1_aa2_real_data_in <= baopoco_dir_x1_aa2_real_data_in_net;
  baopoco_dir_x1_aa2_real_we <= baopoco_dir_x1_aa2_real_we_net;
  baopoco_dir_x1_aa3_real_addr <= baopoco_dir_x1_aa3_real_addr_net;
  baopoco_dir_x1_aa3_real_data_in <= baopoco_dir_x1_aa3_real_data_in_net;
  baopoco_dir_x1_aa3_real_we <= baopoco_dir_x1_aa3_real_we_net;
  baopoco_dir_x1_aa_real_addr <= baopoco_dir_x1_aa_real_addr_net;
  baopoco_dir_x1_aa_real_data_in <= baopoco_dir_x1_aa_real_data_in_net;
  baopoco_dir_x1_aa_real_we <= baopoco_dir_x1_aa_real_we_net;
  baopoco_dir_x1_ab_imag_addr <= baopoco_dir_x1_ab_imag_addr_net;
  baopoco_dir_x1_ab_imag_data_in <= baopoco_dir_x1_ab_imag_data_in_net;
  baopoco_dir_x1_ab_imag_we <= baopoco_dir_x1_ab_imag_we_net;
  baopoco_dir_x1_ab_real_addr <= baopoco_dir_x1_ab_real_addr_net;
  baopoco_dir_x1_ab_real_data_in <= baopoco_dir_x1_ab_real_data_in_net;
  baopoco_dir_x1_ab_real_we <= baopoco_dir_x1_ab_real_we_net;
  baopoco_dir_x1_ac1_imag_addr <= baopoco_dir_x1_ac1_imag_addr_net;
  baopoco_dir_x1_ac1_imag_data_in <= baopoco_dir_x1_ac1_imag_data_in_net;
  baopoco_dir_x1_ac1_imag_we <= baopoco_dir_x1_ac1_imag_we_net;
  baopoco_dir_x1_ac1_real_addr <= baopoco_dir_x1_ac1_real_addr_net;
  baopoco_dir_x1_ac1_real_data_in <= baopoco_dir_x1_ac1_real_data_in_net;
  baopoco_dir_x1_ac1_real_we <= baopoco_dir_x1_ac1_real_we_net;
  baopoco_dir_x1_ac2_imag_addr <= baopoco_dir_x1_ac2_imag_addr_net;
  baopoco_dir_x1_ac2_imag_data_in <= baopoco_dir_x1_ac2_imag_data_in_net;
  baopoco_dir_x1_ac2_imag_we <= baopoco_dir_x1_ac2_imag_we_net;
  baopoco_dir_x1_ac2_real_addr <= baopoco_dir_x1_ac2_real_addr_net;
  baopoco_dir_x1_ac2_real_data_in <= baopoco_dir_x1_ac2_real_data_in_net;
  baopoco_dir_x1_ac2_real_we <= baopoco_dir_x1_ac2_real_we_net;
  baopoco_dir_x1_ac3_imag_addr <= baopoco_dir_x1_ac3_imag_addr_net;
  baopoco_dir_x1_ac3_imag_data_in <= baopoco_dir_x1_ac3_imag_data_in_net;
  baopoco_dir_x1_ac3_imag_we <= baopoco_dir_x1_ac3_imag_we_net;
  baopoco_dir_x1_ac3_real_addr <= baopoco_dir_x1_ac3_real_addr_net;
  baopoco_dir_x1_ac3_real_data_in <= baopoco_dir_x1_ac3_real_data_in_net;
  baopoco_dir_x1_ac3_real_we <= baopoco_dir_x1_ac3_real_we_net;
  baopoco_dir_x1_ac_imag_addr <= baopoco_dir_x1_ac_imag_addr_net;
  baopoco_dir_x1_ac_imag_data_in <= baopoco_dir_x1_ac_imag_data_in_net;
  baopoco_dir_x1_ac_imag_we <= baopoco_dir_x1_ac_imag_we_net;
  baopoco_dir_x1_ac_real_addr <= baopoco_dir_x1_ac_real_addr_net;
  baopoco_dir_x1_ac_real_data_in <= baopoco_dir_x1_ac_real_data_in_net;
  baopoco_dir_x1_ac_real_we <= baopoco_dir_x1_ac_real_we_net;
  baopoco_dir_x1_ad_imag_addr <= baopoco_dir_x1_ad_imag_addr_net;
  baopoco_dir_x1_ad_imag_data_in <= baopoco_dir_x1_ad_imag_data_in_net;
  baopoco_dir_x1_ad_imag_we <= baopoco_dir_x1_ad_imag_we_net;
  baopoco_dir_x1_ad_real_addr <= baopoco_dir_x1_ad_real_addr_net;
  baopoco_dir_x1_ad_real_data_in <= baopoco_dir_x1_ad_real_data_in_net;
  baopoco_dir_x1_ad_real_we <= baopoco_dir_x1_ad_real_we_net;
  baopoco_led0_adc_clip_gateway <= baopoco_led0_adc_clip_gateway_net;
  baopoco_led1_mrst_gateway <= baopoco_led1_mrst_gateway_net;
  baopoco_led2_sync_gateway <= baopoco_led2_sync_gateway_net;
  baopoco_led3_new_acc_gateway <= baopoco_led3_new_acc_gateway_net;
  baopoco_status_user_data_in <= baopoco_status_user_data_in_net;
  gateway_out <= gateway_out_net;
  gateway_out1 <= gateway_out1_net;
  gateway_out1_x0 <= gateway_out1_x0_net;
  gateway_out1_x1 <= gateway_out1_x1_net;
  gateway_out1_x2 <= gateway_out1_x2_net;
  gateway_out1_x3 <= gateway_out1_x3_net;
  gateway_out1_x4 <= gateway_out1_x4_net;
  gateway_out1_x5 <= gateway_out1_x5_net;
  gateway_out1_x6 <= gateway_out1_x6_net;
  gateway_out2 <= gateway_out2_net;
  gateway_out2_x0 <= gateway_out2_x0_net;
  gateway_out2_x1 <= gateway_out2_x1_net;
  gateway_out2_x2 <= gateway_out2_x2_net;
  gateway_out2_x3 <= gateway_out2_x3_net;
  gateway_out2_x4 <= gateway_out2_x4_net;
  gateway_out2_x5 <= gateway_out2_x5_net;
  gateway_out2_x6 <= gateway_out2_x6_net;
  gateway_out3 <= gateway_out3_net;
  gateway_out3_x0 <= gateway_out3_x0_net;
  gateway_out3_x1 <= gateway_out3_x1_net;
  gateway_out3_x2 <= gateway_out3_x2_net;
  gateway_out3_x3 <= gateway_out3_x3_net;
  gateway_out3_x4 <= gateway_out3_x4_net;
  gateway_out3_x5 <= gateway_out3_x5_net;
  gateway_out3_x6 <= gateway_out3_x6_net;
  gateway_out_x0 <= gateway_out_x0_net;
  gateway_out_x1 <= gateway_out_x1_net;
  gateway_out_x2 <= gateway_out_x2_net;
  gateway_out_x3 <= gateway_out_x3_net;
  gateway_out_x4 <= gateway_out_x4_net;
  gateway_out_x5 <= gateway_out_x5_net;
  gateway_out_x6 <= gateway_out_x6_net;

  a0p0_1st_shift_6b28cbec7c: entity work.a0p0_1st_shift_entity_6b28cbec7c
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din1 => convert_1_1_dout_net_x1,
      din2 => convert_1_2_dout_net_x1,
      din3 => convert_1_3_dout_net_x1,
      din4 => convert_1_4_dout_net_x1,
      sync_in => delay1_q_net_x2,
      dout1 => shift3_op_net_x3,
      dout2 => shift1_op_net_x3,
      dout3 => shift2_op_net_x3,
      dout4 => shift4_op_net_x3,
      sync_out => delay_q_net_x5
    );

  a0p1_1st_shift_bd90d1da6f: entity work.a0p0_1st_shift_entity_6b28cbec7c
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din1 => convert_1_1_dout_net_x2,
      din2 => convert_1_2_dout_net_x2,
      din3 => convert_1_3_dout_net_x2,
      din4 => convert_1_4_dout_net_x2,
      sync_in => delay1_q_net_x3,
      dout1 => shift3_op_net_x4,
      dout2 => shift1_op_net_x4,
      dout3 => shift2_op_net_x4,
      dout4 => shift4_op_net_x4,
      sync_out => delay_q_net_x6
    );

  a1p0_1st_shift_c2416de3f8: entity work.a0p0_1st_shift_entity_6b28cbec7c
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din1 => convert_1_1_dout_net_x3,
      din2 => convert_1_2_dout_net_x3,
      din3 => convert_1_3_dout_net_x3,
      din4 => convert_1_4_dout_net_x3,
      sync_in => delay1_q_net_x4,
      dout1 => shift3_op_net_x5,
      dout2 => shift1_op_net_x5,
      dout3 => shift2_op_net_x5,
      dout4 => shift4_op_net_x5,
      sync_out => delay_q_net_x7
    );

  a1p1_1st_shift_87a91b74c9: entity work.a0p0_1st_shift_entity_6b28cbec7c
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din1 => convert_1_1_dout_net_x4,
      din2 => convert_1_2_dout_net_x4,
      din3 => convert_1_3_dout_net_x4,
      din4 => convert_1_4_dout_net_x4,
      sync_in => delay1_q_net_x5,
      dout1 => shift3_op_net_x6,
      dout2 => shift1_op_net_x6,
      dout3 => shift2_op_net_x6,
      dout4 => shift4_op_net_x6,
      sync_out => delay_q_net_x8
    );

  acc_ctrl_d11c827fe8: entity work.acc_ctrl_entity_d11c827fe8
    port map (
      acc_len => baopoco_acc_len_user_data_out_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      mrst => delay1_q_net_x6,
      sync => delay4_q_net_x1,
      new_acc => logical_y_net_x3
    );

  acc_num_e7d623cae3: entity work.acc_num_entity_e7d623cae3
    port map (
      reg_out => counter1_op_net_x0,
      convert_x0 => baopoco_acc_num_user_data_in_net
    );

  adc1_70310c336e: entity work.adc1_entity_70310c336e
    port map (
      baopoco_adc1_user_datai0 => baopoco_adc1_user_datai0_net,
      baopoco_adc1_user_datai1 => baopoco_adc1_user_datai1_net,
      baopoco_adc1_user_datai2 => baopoco_adc1_user_datai2_net,
      baopoco_adc1_user_datai3 => baopoco_adc1_user_datai3_net,
      baopoco_adc1_user_dataq0 => baopoco_adc1_user_dataq0_net,
      baopoco_adc1_user_dataq1 => baopoco_adc1_user_dataq1_net,
      baopoco_adc1_user_dataq2 => baopoco_adc1_user_dataq2_net,
      baopoco_adc1_user_dataq3 => baopoco_adc1_user_dataq3_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      i0 => reinterpret_output_port_net_x20,
      i1 => reinterpret_output_port_net_x21,
      i2 => reinterpret_output_port_net_x22,
      i3 => reinterpret_output_port_net_x23,
      q0 => reinterpret_output_port_net_x24,
      q1 => reinterpret_output_port_net_x25,
      q2 => reinterpret_output_port_net_x26,
      q3 => reinterpret_output_port_net_x27
    );

  adc_9e0b1c0f18: entity work.adc_entity_9e0b1c0f18
    port map (
      baopoco_adc_user_datai0 => baopoco_adc_user_datai0_net,
      baopoco_adc_user_datai1 => baopoco_adc_user_datai1_net,
      baopoco_adc_user_datai2 => baopoco_adc_user_datai2_net,
      baopoco_adc_user_datai3 => baopoco_adc_user_datai3_net,
      baopoco_adc_user_dataq0 => baopoco_adc_user_dataq0_net,
      baopoco_adc_user_dataq1 => baopoco_adc_user_dataq1_net,
      baopoco_adc_user_dataq2 => baopoco_adc_user_dataq2_net,
      baopoco_adc_user_dataq3 => baopoco_adc_user_dataq3_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      i0 => reinterpret_output_port_net_x12,
      i1 => reinterpret_output_port_net_x13,
      i2 => reinterpret_output_port_net_x14,
      i3 => reinterpret_output_port_net_x15,
      q0 => reinterpret_output_port_net_x16,
      q1 => reinterpret_output_port_net_x17,
      q2 => reinterpret_output_port_net_x18,
      q3 => reinterpret_output_port_net_x19
    );

  adc_sum0_d6bc62b516: entity work.adc_sum0_entity_d6bc62b516
    port map (
      reg_out => convert2_dout_net_x1,
      convert_x0 => baopoco_adc_sum0_user_data_in_net
    );

  adc_sum1_d1e2262aec: entity work.adc_sum0_entity_d6bc62b516
    port map (
      reg_out => convert2_dout_net_x2,
      convert_x0 => baopoco_adc_sum1_user_data_in_net
    );

  adc_sum2_da665ba6ee: entity work.adc_sum0_entity_d6bc62b516
    port map (
      reg_out => convert2_dout_net_x3,
      convert_x0 => baopoco_adc_sum2_user_data_in_net
    );

  adc_sum3_a84b140808: entity work.adc_sum0_entity_d6bc62b516
    port map (
      reg_out => convert2_dout_net_x4,
      convert_x0 => baopoco_adc_sum3_user_data_in_net
    );

  adc_sum_sq0_8fb005d573: entity work.acc_num_entity_e7d623cae3
    port map (
      reg_out => convert1_dout_net_x1,
      convert_x0 => baopoco_adc_sum_sq0_user_data_in_net
    );

  adc_sum_sq1_c514d1b0b2: entity work.acc_num_entity_e7d623cae3
    port map (
      reg_out => convert1_dout_net_x2,
      convert_x0 => baopoco_adc_sum_sq1_user_data_in_net
    );

  adc_sum_sq2_33174846b3: entity work.acc_num_entity_e7d623cae3
    port map (
      reg_out => convert1_dout_net_x3,
      convert_x0 => baopoco_adc_sum_sq2_user_data_in_net
    );

  adc_sum_sq3_6d64db8423: entity work.acc_num_entity_e7d623cae3
    port map (
      reg_out => convert1_dout_net_x4,
      convert_x0 => baopoco_adc_sum_sq3_user_data_in_net
    );

  adc_unpack0_3a91f4ad2d: entity work.adc_unpack0_entity_3a91f4ad2d
    port map (
      in1 => delay_q_net_x1,
      out1 => reinterpret_output_port_net_x3,
      out2 => reinterpret1_output_port_net_x3,
      out3 => reinterpret2_output_port_net_x3,
      out4 => reinterpret3_output_port_net_x3
    );

  adc_unpack1_531e718753: entity work.adc_unpack0_entity_3a91f4ad2d
    port map (
      in1 => delay1_q_net_x1,
      out1 => reinterpret_output_port_net_x28,
      out2 => reinterpret1_output_port_net_x4,
      out3 => reinterpret2_output_port_net_x4,
      out4 => reinterpret3_output_port_net_x4
    );

  adc_unpack2_0c9963c36b: entity work.adc_unpack0_entity_3a91f4ad2d
    port map (
      in1 => delay10_q_net_x1,
      out1 => reinterpret_output_port_net_x29,
      out2 => reinterpret1_output_port_net_x5,
      out3 => reinterpret2_output_port_net_x5,
      out4 => reinterpret3_output_port_net_x5
    );

  adc_unpack3_5dad712599: entity work.adc_unpack0_entity_3a91f4ad2d
    port map (
      in1 => delay11_q_net_x1,
      out1 => reinterpret_output_port_net_x30,
      out2 => reinterpret1_output_port_net_x6,
      out3 => reinterpret2_output_port_net_x6,
      out4 => reinterpret3_output_port_net_x6
    );

  calc_adc_sum_sq1_365415ac86: entity work.calc_adc_sum_sq_entity_42d21d7c12
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in1 => reinterpret2_output_port_net_x7,
      in2 => reinterpret1_output_port_net_x7,
      in3 => reinterpret3_output_port_net_x7,
      in4 => reinterpret4_output_port_net_x2,
      sum => convert2_dout_net_x2,
      sum_sq => convert1_dout_net_x2
    );

  calc_adc_sum_sq2_613020dabb: entity work.calc_adc_sum_sq_entity_42d21d7c12
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in1 => reinterpret2_output_port_net_x8,
      in2 => reinterpret1_output_port_net_x8,
      in3 => reinterpret3_output_port_net_x8,
      in4 => reinterpret4_output_port_net_x3,
      sum => convert2_dout_net_x3,
      sum_sq => convert1_dout_net_x3
    );

  calc_adc_sum_sq3_5543c2432d: entity work.calc_adc_sum_sq_entity_42d21d7c12
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in1 => reinterpret2_output_port_net_x9,
      in2 => reinterpret1_output_port_net_x9,
      in3 => reinterpret3_output_port_net_x9,
      in4 => reinterpret4_output_port_net_x4,
      sum => convert2_dout_net_x4,
      sum_sq => convert1_dout_net_x4
    );

  calc_adc_sum_sq_42d21d7c12: entity work.calc_adc_sum_sq_entity_42d21d7c12
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in1 => reinterpret2_output_port_net_x1,
      in2 => reinterpret1_output_port_net_x1,
      in3 => reinterpret3_output_port_net_x1,
      in4 => reinterpret4_output_port_net_x1,
      sum => convert2_dout_net_x1,
      sum_sq => convert1_dout_net_x1
    );

  clip_detect_02e572e7fb: entity work.clip_detect_entity_02e572e7fb
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_01 => delay8_q_net_x0,
      in_02 => delay12_q_net_x0,
      in_03 => delay13_q_net_x0,
      in_04 => constant16_op_net_x0,
      in_05 => constant13_op_net_x0,
      in_06 => constant18_op_net_x0,
      in_07 => constant17_op_net_x0,
      in_08 => of_or_y_net_x4,
      in_09 => of_or_y_net_x5,
      in_10 => of_or_y_net_x6,
      in_11 => of_or_y_net_x7,
      in_12 => constant12_op_net_x0,
      in_13 => constant10_op_net_x0,
      in_14 => constant8_op_net_x0,
      in_15 => constant7_op_net_x0,
      in_16 => delay5_q_net_x8,
      in_17 => delay5_q_net_x9,
      in_18 => delay5_q_net_x10,
      in_19 => delay5_q_net_x11,
      in_20 => constant6_op_net_x0,
      in_21 => constant5_op_net_x0,
      in_22 => constant4_op_net_x0,
      in_23 => constant15_op_net_x0,
      in_24_nr => constant21_op_net_x0,
      in_25_nr => constant20_op_net_x0,
      in_26_nr => constant3_op_net_x0,
      in_27_nr => constant19_op_net_x0,
      in_28_nr => constant14_op_net_x0,
      in_29_nr => delay5_q_net_x7,
      in_30_nr => delay2_q_net_x42,
      in_lsb => delay2_q_net_x2,
      in_msb_nr => delay1_q_net_x6,
      rst => delay16_q_net_x0,
      registered_out => concat1_y_net_x1
    );

  concat6: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x2,
      in1 => concat_y_net_x4,
      in2 => concat_y_net_x6,
      in3 => concat_y_net_x8,
      y => concat6_y_net
    );

  concat7: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x3,
      in1 => concat_y_net_x5,
      in2 => concat_y_net_x7,
      in3 => concat_y_net_x9,
      y => concat7_y_net
    );

  constant10: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant10_op_net_x0
    );

  constant12: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant12_op_net_x0
    );

  constant13: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant13_op_net_x0
    );

  constant14: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant14_op_net_x0
    );

  constant15: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant15_op_net_x0
    );

  constant16: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant16_op_net_x0
    );

  constant17: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant17_op_net_x0
    );

  constant18: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant18_op_net_x0
    );

  constant19: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant19_op_net_x0
    );

  constant20: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant20_op_net_x0
    );

  constant21: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant21_op_net_x0
    );

  constant3: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net_x0
    );

  constant4: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant4_op_net_x0
    );

  constant5: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant5_op_net_x0
    );

  constant6: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant6_op_net_x0
    );

  constant7: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant7_op_net_x0
    );

  constant8: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant8_op_net_x0
    );

  counter1: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_87d335e994d59139",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      en(0) => delay3_q_net,
      rst(0) => delay1_q_net_x6,
      op => counter1_op_net_x0
    );

  decat0_c0c8c43019: entity work.decat0_entity_c0c8c43019
    port map (
      in1 => delay_q_net_x1,
      out1 => reinterpret2_output_port_net_x1,
      out2 => reinterpret1_output_port_net_x1,
      out3 => reinterpret3_output_port_net_x1,
      out4 => reinterpret4_output_port_net_x1
    );

  decat1_6f3c7ffc47: entity work.decat0_entity_c0c8c43019
    port map (
      in1 => delay1_q_net_x1,
      out1 => reinterpret2_output_port_net_x7,
      out2 => reinterpret1_output_port_net_x7,
      out3 => reinterpret3_output_port_net_x7,
      out4 => reinterpret4_output_port_net_x2
    );

  decat2_a0562c80f4: entity work.decat0_entity_c0c8c43019
    port map (
      in1 => delay10_q_net_x1,
      out1 => reinterpret2_output_port_net_x8,
      out2 => reinterpret1_output_port_net_x8,
      out3 => reinterpret3_output_port_net_x8,
      out4 => reinterpret4_output_port_net_x3
    );

  decat3_5b26640296: entity work.decat0_entity_c0c8c43019
    port map (
      in1 => delay11_q_net_x1,
      out1 => reinterpret2_output_port_net_x9,
      out2 => reinterpret1_output_port_net_x9,
      out3 => reinterpret3_output_port_net_x9,
      out4 => reinterpret4_output_port_net_x4
    );

  delay: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d => concat3_y_net_x0,
      q => delay_q_net_x1
    );

  delay1: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d => concat3_y_net_x1,
      q => delay1_q_net_x1
    );

  delay10: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d => concat3_y_net_x2,
      q => delay10_q_net_x1
    );

  delay11: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d => concat3_y_net_x3,
      q => delay11_q_net_x1
    );

  delay12: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical9_y_net,
      q(0) => delay12_q_net_x0
    );

  delay13: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical8_y_net,
      q(0) => delay13_q_net_x0
    );

  delay14: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical6_y_net,
      q(0) => delay14_q_net
    );

  delay15: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical_y_net_x0,
      q(0) => delay15_q_net_x1
    );

  delay16: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical_y_net_x4,
      q(0) => delay16_q_net_x0
    );

  delay2: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical2_y_net,
      q(0) => delay2_q_net_x2
    );

  delay20: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d => concat7_y_net,
      q => delay20_q_net
    );

  delay21: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d => concat6_y_net,
      q => delay21_q_net
    );

  delay3: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => delay6_q_net_x10,
      q(0) => delay3_q_net
    );

  delay4: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical_y_net_x5,
      q(0) => delay4_q_net
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => delay6_q_net_x10,
      q(0) => delay5_q_net_x7
    );

  delay6: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay6_q_net_x10
    );

  delay7: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay7_q_net_x10
    );

  delay8: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical1_y_net,
      q(0) => delay8_q_net_x0
    );

  delay9: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      d(0) => logical_y_net,
      q(0) => delay9_q_net
    );

  dir_x0_7ae486fe94: entity work.dir_x0_entity_7ae486fe94
    port map (
      a => slice12_y_net_x9,
      b => slice13_y_net_x9,
      c => slice15_y_net_x9,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      d => slice20_y_net_x9,
      new_acc => delay6_q_net_x10,
      aa => gateway_out_net,
      aa1 => gateway_out_x0_net,
      aa1_x0 => gateway_out3_x0_net,
      aa1_x1 => gateway_out1_x0_net,
      aa1_x2 => baopoco_dir_x0_aa1_real_addr_net,
      aa1_x3 => baopoco_dir_x0_aa1_real_data_in_net,
      aa1_x4 => baopoco_dir_x0_aa1_real_we_net,
      aa1_x5 => gateway_out2_x0_net,
      aa2 => gateway_out_x1_net,
      aa2_x0 => gateway_out3_x1_net,
      aa2_x1 => gateway_out1_x1_net,
      aa2_x2 => baopoco_dir_x0_aa2_real_addr_net,
      aa2_x3 => baopoco_dir_x0_aa2_real_data_in_net,
      aa2_x4 => baopoco_dir_x0_aa2_real_we_net,
      aa2_x5 => gateway_out2_x1_net,
      aa3 => gateway_out_x2_net,
      aa3_x0 => gateway_out3_x2_net,
      aa3_x1 => gateway_out1_x2_net,
      aa3_x2 => baopoco_dir_x0_aa3_real_addr_net,
      aa3_x3 => baopoco_dir_x0_aa3_real_data_in_net,
      aa3_x4 => baopoco_dir_x0_aa3_real_we_net,
      aa3_x5 => gateway_out2_x2_net,
      aa_x0 => gateway_out3_net,
      aa_x1 => gateway_out1_net,
      aa_x2 => baopoco_dir_x0_aa_real_addr_net,
      aa_x3 => baopoco_dir_x0_aa_real_data_in_net,
      aa_x4 => baopoco_dir_x0_aa_real_we_net,
      aa_x5 => gateway_out2_net,
      ab => baopoco_dir_x0_ab_imag_addr_net,
      ab_x0 => baopoco_dir_x0_ab_imag_data_in_net,
      ab_x1 => baopoco_dir_x0_ab_imag_we_net,
      ab_x2 => baopoco_dir_x0_ab_real_addr_net,
      ab_x3 => baopoco_dir_x0_ab_real_data_in_net,
      ab_x4 => baopoco_dir_x0_ab_real_we_net,
      ac => baopoco_dir_x0_ac_imag_addr_net,
      ac1 => baopoco_dir_x0_ac1_imag_addr_net,
      ac1_x0 => baopoco_dir_x0_ac1_imag_data_in_net,
      ac1_x1 => baopoco_dir_x0_ac1_imag_we_net,
      ac1_x2 => baopoco_dir_x0_ac1_real_addr_net,
      ac1_x3 => baopoco_dir_x0_ac1_real_data_in_net,
      ac1_x4 => baopoco_dir_x0_ac1_real_we_net,
      ac2 => baopoco_dir_x0_ac2_imag_addr_net,
      ac2_x0 => baopoco_dir_x0_ac2_imag_data_in_net,
      ac2_x1 => baopoco_dir_x0_ac2_imag_we_net,
      ac2_x2 => baopoco_dir_x0_ac2_real_addr_net,
      ac2_x3 => baopoco_dir_x0_ac2_real_data_in_net,
      ac2_x4 => baopoco_dir_x0_ac2_real_we_net,
      ac3 => baopoco_dir_x0_ac3_imag_addr_net,
      ac3_x0 => baopoco_dir_x0_ac3_imag_data_in_net,
      ac3_x1 => baopoco_dir_x0_ac3_imag_we_net,
      ac3_x2 => baopoco_dir_x0_ac3_real_addr_net,
      ac3_x3 => baopoco_dir_x0_ac3_real_data_in_net,
      ac3_x4 => baopoco_dir_x0_ac3_real_we_net,
      ac_x0 => baopoco_dir_x0_ac_imag_data_in_net,
      ac_x1 => baopoco_dir_x0_ac_imag_we_net,
      ac_x2 => baopoco_dir_x0_ac_real_addr_net,
      ac_x3 => baopoco_dir_x0_ac_real_data_in_net,
      ac_x4 => baopoco_dir_x0_ac_real_we_net,
      ad => baopoco_dir_x0_ad_imag_addr_net,
      ad_x0 => baopoco_dir_x0_ad_imag_data_in_net,
      ad_x1 => baopoco_dir_x0_ad_imag_we_net,
      ad_x2 => baopoco_dir_x0_ad_real_addr_net,
      ad_x3 => baopoco_dir_x0_ad_real_data_in_net,
      ad_x4 => baopoco_dir_x0_ad_real_we_net
    );

  dir_x1_246640229b: entity work.dir_x0_entity_7ae486fe94
    port map (
      a => slice36_y_net_x9,
      b => slice37_y_net_x9,
      c => slice38_y_net_x9,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      d => slice39_y_net_x9,
      new_acc => delay7_q_net_x10,
      aa => gateway_out_x3_net,
      aa1 => gateway_out_x4_net,
      aa1_x0 => gateway_out3_x4_net,
      aa1_x1 => gateway_out1_x4_net,
      aa1_x2 => baopoco_dir_x1_aa1_real_addr_net,
      aa1_x3 => baopoco_dir_x1_aa1_real_data_in_net,
      aa1_x4 => baopoco_dir_x1_aa1_real_we_net,
      aa1_x5 => gateway_out2_x4_net,
      aa2 => gateway_out_x5_net,
      aa2_x0 => gateway_out3_x5_net,
      aa2_x1 => gateway_out1_x5_net,
      aa2_x2 => baopoco_dir_x1_aa2_real_addr_net,
      aa2_x3 => baopoco_dir_x1_aa2_real_data_in_net,
      aa2_x4 => baopoco_dir_x1_aa2_real_we_net,
      aa2_x5 => gateway_out2_x5_net,
      aa3 => gateway_out_x6_net,
      aa3_x0 => gateway_out3_x6_net,
      aa3_x1 => gateway_out1_x6_net,
      aa3_x2 => baopoco_dir_x1_aa3_real_addr_net,
      aa3_x3 => baopoco_dir_x1_aa3_real_data_in_net,
      aa3_x4 => baopoco_dir_x1_aa3_real_we_net,
      aa3_x5 => gateway_out2_x6_net,
      aa_x0 => gateway_out3_x3_net,
      aa_x1 => gateway_out1_x3_net,
      aa_x2 => baopoco_dir_x1_aa_real_addr_net,
      aa_x3 => baopoco_dir_x1_aa_real_data_in_net,
      aa_x4 => baopoco_dir_x1_aa_real_we_net,
      aa_x5 => gateway_out2_x3_net,
      ab => baopoco_dir_x1_ab_imag_addr_net,
      ab_x0 => baopoco_dir_x1_ab_imag_data_in_net,
      ab_x1 => baopoco_dir_x1_ab_imag_we_net,
      ab_x2 => baopoco_dir_x1_ab_real_addr_net,
      ab_x3 => baopoco_dir_x1_ab_real_data_in_net,
      ab_x4 => baopoco_dir_x1_ab_real_we_net,
      ac => baopoco_dir_x1_ac_imag_addr_net,
      ac1 => baopoco_dir_x1_ac1_imag_addr_net,
      ac1_x0 => baopoco_dir_x1_ac1_imag_data_in_net,
      ac1_x1 => baopoco_dir_x1_ac1_imag_we_net,
      ac1_x2 => baopoco_dir_x1_ac1_real_addr_net,
      ac1_x3 => baopoco_dir_x1_ac1_real_data_in_net,
      ac1_x4 => baopoco_dir_x1_ac1_real_we_net,
      ac2 => baopoco_dir_x1_ac2_imag_addr_net,
      ac2_x0 => baopoco_dir_x1_ac2_imag_data_in_net,
      ac2_x1 => baopoco_dir_x1_ac2_imag_we_net,
      ac2_x2 => baopoco_dir_x1_ac2_real_addr_net,
      ac2_x3 => baopoco_dir_x1_ac2_real_data_in_net,
      ac2_x4 => baopoco_dir_x1_ac2_real_we_net,
      ac3 => baopoco_dir_x1_ac3_imag_addr_net,
      ac3_x0 => baopoco_dir_x1_ac3_imag_data_in_net,
      ac3_x1 => baopoco_dir_x1_ac3_imag_we_net,
      ac3_x2 => baopoco_dir_x1_ac3_real_addr_net,
      ac3_x3 => baopoco_dir_x1_ac3_real_data_in_net,
      ac3_x4 => baopoco_dir_x1_ac3_real_we_net,
      ac_x0 => baopoco_dir_x1_ac_imag_data_in_net,
      ac_x1 => baopoco_dir_x1_ac_imag_we_net,
      ac_x2 => baopoco_dir_x1_ac_real_addr_net,
      ac_x3 => baopoco_dir_x1_ac_real_data_in_net,
      ac_x4 => baopoco_dir_x1_ac_real_we_net,
      ad => baopoco_dir_x1_ad_imag_addr_net,
      ad_x0 => baopoco_dir_x1_ad_imag_data_in_net,
      ad_x1 => baopoco_dir_x1_ad_imag_we_net,
      ad_x2 => baopoco_dir_x1_ad_real_addr_net,
      ad_x3 => baopoco_dir_x1_ad_real_data_in_net,
      ad_x4 => baopoco_dir_x1_ad_real_we_net
    );

  fft_wideband_real1_d1486c2c60: entity work.fft_wideband_real_entity_06b506694e
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in0 => shift3_op_net_x4,
      in1 => shift1_op_net_x4,
      in2 => shift2_op_net_x4,
      in3 => shift4_op_net_x4,
      shift => slice6_y_net_x23,
      sync => delay_q_net_x6,
      of_x0 => of_or_y_net_x5,
      out0 => bram0_data_out_net_x4,
      out1 => bram1_data_out_net_x4,
      sync_out => post_sync_delay_q_net_x5
    );

  fft_wideband_real2_6e9a6972c0: entity work.fft_wideband_real_entity_06b506694e
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in0 => shift3_op_net_x5,
      in1 => shift1_op_net_x5,
      in2 => shift2_op_net_x5,
      in3 => shift4_op_net_x5,
      shift => slice6_y_net_x23,
      sync => delay_q_net_x7,
      of_x0 => of_or_y_net_x6,
      out0 => bram0_data_out_net_x5,
      out1 => bram1_data_out_net_x5,
      sync_out => post_sync_delay_q_net_x6
    );

  fft_wideband_real3_f6612ef462: entity work.fft_wideband_real_entity_06b506694e
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in0 => shift3_op_net_x6,
      in1 => shift1_op_net_x6,
      in2 => shift2_op_net_x6,
      in3 => shift4_op_net_x6,
      shift => slice6_y_net_x23,
      sync => delay_q_net_x8,
      of_x0 => of_or_y_net_x7,
      out0 => bram0_data_out_net_x6,
      out1 => bram1_data_out_net_x6,
      sync_out => post_sync_delay_q_net_x7
    );

  fft_wideband_real_06b506694e: entity work.fft_wideband_real_entity_06b506694e
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in0 => shift3_op_net_x3,
      in1 => shift1_op_net_x3,
      in2 => shift2_op_net_x3,
      in3 => shift4_op_net_x3,
      shift => slice6_y_net_x23,
      sync => delay_q_net_x5,
      of_x0 => of_or_y_net_x4,
      out0 => bram0_data_out_net_x3,
      out1 => bram1_data_out_net_x3,
      sync_out => post_sync_delay_q_net_x4
    );

  inverter: entity work.inverter_6844eee868
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      ip(0) => logical_y_net_x1,
      op(0) => inverter_op_net_x0
    );

  inverter1: entity work.inverter_6844eee868
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      ip(0) => logical_y_net_x2,
      op(0) => inverter1_op_net_x0
    );

  inverter2: entity work.inverter_6844eee868
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      ip(0) => relational5_op_net_x0,
      op(0) => inverter2_op_net_x0
    );

  inverter3: entity work.inverter_6844eee868
    port map (
      ce => ce_1_sg_x869,
      clk => clk_1_sg_x869,
      clr => '0',
      ip(0) => relational5_op_net_x15,
      op(0) => inverter3_op_net_x0
    );

  led0_adc_clip_1ad502548d: entity work.led0_adc_clip_entity_1ad502548d
    port map (
      gpio_out => inverter_op_net_x0,
      convert_x0 => baopoco_led0_adc_clip_gateway_net
    );

  led1_mrst_320de39690: entity work.led0_adc_clip_entity_1ad502548d
    port map (
      gpio_out => inverter1_op_net_x0,
      convert_x0 => baopoco_led1_mrst_gateway_net
    );

  led2_sync_1de7de981f: entity work.led0_adc_clip_entity_1ad502548d
    port map (
      gpio_out => inverter2_op_net_x0,
      convert_x0 => baopoco_led2_sync_gateway_net
    );

  led3_new_acc_a7ee4986ff: entity work.led3_new_acc_entity_a7ee4986ff
    port map (
      gpio_out => inverter3_op_net_x0,
      convert_x0 => baopoco_led3_new_acc_gateway_net
    );

  logical: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => baopoco_adc_user_sync0_net,
      d1(0) => baopoco_adc_user_sync1_net,
      d2(0) => baopoco_adc_user_sync2_net,
      d3(0) => baopoco_adc_user_sync3_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => baopoco_adc_user_outofrangeq0_net,
      d1(0) => baopoco_adc_user_outofrangeq1_net,
      y(0) => logical1_y_net
    );

  logical2: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => baopoco_adc_user_outofrangei0_net,
      d1(0) => baopoco_adc_user_outofrangei1_net,
      y(0) => logical2_y_net
    );

  logical3: entity work.logical_6cb8f0ce02
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay4_q_net,
      d1(0) => delay9_q_net,
      d2(0) => delay14_q_net,
      y(0) => logical3_y_net_x1
    );

  logical4: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay2_q_net_x2,
      d1(0) => delay8_q_net_x0,
      d2(0) => delay12_q_net_x0,
      d3(0) => delay13_q_net_x0,
      y(0) => logical4_y_net_x1
    );

  logical6: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => baopoco_adc1_user_sync0_net,
      d1(0) => baopoco_adc1_user_sync1_net,
      d2(0) => baopoco_adc1_user_sync2_net,
      d3(0) => baopoco_adc1_user_sync3_net,
      y(0) => logical6_y_net
    );

  logical8: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => baopoco_adc1_user_outofrangeq0_net,
      d1(0) => baopoco_adc1_user_outofrangeq1_net,
      y(0) => logical8_y_net
    );

  logical9: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => baopoco_adc1_user_outofrangei0_net,
      d1(0) => baopoco_adc1_user_outofrangei1_net,
      y(0) => logical9_y_net
    );

  negedge_delay1_b1d57386a9: entity work.negedge_delay_entity_b89abc8c2c
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => delay1_q_net_x6,
      out_x0 => logical_y_net_x2
    );

  negedge_delay_b89abc8c2c: entity work.negedge_delay_entity_b89abc8c2c
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => logical4_y_net_x1,
      out_x0 => logical_y_net_x1
    );

  pfb_fir_real1_9520943d21: entity work.pfb_fir_real_entity_6a03e08f19
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      pol1_in1 => reinterpret_output_port_net_x28,
      pol1_in2 => reinterpret1_output_port_net_x4,
      pol1_in3 => reinterpret2_output_port_net_x4,
      pol1_in4 => reinterpret3_output_port_net_x4,
      sync => delay2_q_net_x42,
      pol1_out1 => convert_1_1_dout_net_x2,
      pol1_out2 => convert_1_2_dout_net_x2,
      pol1_out3 => convert_1_3_dout_net_x2,
      pol1_out4 => convert_1_4_dout_net_x2,
      sync_out => delay1_q_net_x3
    );

  pfb_fir_real2_156ed3d4fd: entity work.pfb_fir_real_entity_6a03e08f19
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      pol1_in1 => reinterpret_output_port_net_x29,
      pol1_in2 => reinterpret1_output_port_net_x5,
      pol1_in3 => reinterpret2_output_port_net_x5,
      pol1_in4 => reinterpret3_output_port_net_x5,
      sync => delay2_q_net_x42,
      pol1_out1 => convert_1_1_dout_net_x3,
      pol1_out2 => convert_1_2_dout_net_x3,
      pol1_out3 => convert_1_3_dout_net_x3,
      pol1_out4 => convert_1_4_dout_net_x3,
      sync_out => delay1_q_net_x4
    );

  pfb_fir_real3_e60537b135: entity work.pfb_fir_real_entity_6a03e08f19
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      pol1_in1 => reinterpret_output_port_net_x30,
      pol1_in2 => reinterpret1_output_port_net_x6,
      pol1_in3 => reinterpret2_output_port_net_x6,
      pol1_in4 => reinterpret3_output_port_net_x6,
      sync => delay2_q_net_x42,
      pol1_out1 => convert_1_1_dout_net_x4,
      pol1_out2 => convert_1_2_dout_net_x4,
      pol1_out3 => convert_1_3_dout_net_x4,
      pol1_out4 => convert_1_4_dout_net_x4,
      sync_out => delay1_q_net_x5
    );

  pfb_fir_real_6a03e08f19: entity work.pfb_fir_real_entity_6a03e08f19
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      pol1_in1 => reinterpret_output_port_net_x3,
      pol1_in2 => reinterpret1_output_port_net_x3,
      pol1_in3 => reinterpret2_output_port_net_x3,
      pol1_in4 => reinterpret3_output_port_net_x3,
      sync => delay2_q_net_x42,
      pol1_out1 => convert_1_1_dout_net_x1,
      pol1_out2 => convert_1_2_dout_net_x1,
      pol1_out3 => convert_1_3_dout_net_x1,
      pol1_out4 => convert_1_4_dout_net_x1,
      sync_out => delay1_q_net_x2
    );

  pol_pack0_aeb6388850: entity work.pol_pack0_entity_aeb6388850
    port map (
      in1 => reinterpret_output_port_net_x12,
      in2 => reinterpret_output_port_net_x13,
      in3 => reinterpret_output_port_net_x14,
      in4 => reinterpret_output_port_net_x15,
      out1 => concat3_y_net_x0
    );

  pol_pack1_3acf583a46: entity work.pol_pack0_entity_aeb6388850
    port map (
      in1 => reinterpret_output_port_net_x16,
      in2 => reinterpret_output_port_net_x17,
      in3 => reinterpret_output_port_net_x18,
      in4 => reinterpret_output_port_net_x19,
      out1 => concat3_y_net_x1
    );

  pol_pack2_4deeb869f2: entity work.pol_pack0_entity_aeb6388850
    port map (
      in1 => reinterpret_output_port_net_x20,
      in2 => reinterpret_output_port_net_x21,
      in3 => reinterpret_output_port_net_x22,
      in4 => reinterpret_output_port_net_x23,
      out1 => concat3_y_net_x2
    );

  pol_pack3_777479e3b9: entity work.pol_pack0_entity_aeb6388850
    port map (
      in1 => reinterpret_output_port_net_x24,
      in2 => reinterpret_output_port_net_x25,
      in3 => reinterpret_output_port_net_x26,
      in4 => reinterpret_output_port_net_x27,
      out1 => concat3_y_net_x3
    );

  posedge11_4c577f6e03: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => slice31_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  posedge12_7ad68bb06d: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => slice26_y_net_x0,
      out_x0 => logical_y_net_x4
    );

  posedge13_9cdd887d0f: entity work.posedge1_entity_db6dbfef24
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => slice32_y_net_x0,
      out_x0 => logical_y_net_x5
    );

  pulse_ext2_4b5b2f17d0: entity work.pulse_ext2_entity_4b5b2f17d0
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => delay2_q_net_x42,
      out_x0 => relational5_op_net_x0
    );

  pulse_ext6_6f4643a078: entity work.pulse_ext2_entity_4b5b2f17d0
    port map (
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      in_x0 => delay5_q_net_x7,
      out_x0 => relational5_op_net_x15
    );

  quant0_f9a8447551: entity work.quant0_entity_f9a8447551
    port map (
      baopoco_quant0_addr_user_data_out => baopoco_quant0_addr_user_data_out_net,
      baopoco_quant0_gain_user_data_out => baopoco_quant0_gain_user_data_out_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din0 => bram0_data_out_net_x3,
      din1 => bram1_data_out_net_x3,
      sync => post_sync_delay_q_net_x4,
      clip_out => delay5_q_net_x8,
      dout0 => concat_y_net_x2,
      dout1 => concat_y_net_x3,
      sync_out => delay4_q_net_x1
    );

  quant1_3ae2e9f529: entity work.quant1_entity_3ae2e9f529
    port map (
      baopoco_quant1_addr_user_data_out => baopoco_quant1_addr_user_data_out_net,
      baopoco_quant1_gain_user_data_out => baopoco_quant1_gain_user_data_out_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din0 => bram0_data_out_net_x4,
      din1 => bram1_data_out_net_x4,
      sync => post_sync_delay_q_net_x5,
      clip_out => delay5_q_net_x9,
      dout0 => concat_y_net_x4,
      dout1 => concat_y_net_x5
    );

  quant2_ef9b1af5b9: entity work.quant2_entity_ef9b1af5b9
    port map (
      baopoco_quant2_addr_user_data_out => baopoco_quant2_addr_user_data_out_net,
      baopoco_quant2_gain_user_data_out => baopoco_quant2_gain_user_data_out_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din0 => bram0_data_out_net_x5,
      din1 => bram1_data_out_net_x5,
      sync => post_sync_delay_q_net_x6,
      clip_out => delay5_q_net_x10,
      dout0 => concat_y_net_x6,
      dout1 => concat_y_net_x7
    );

  quant3_7125387a5b: entity work.quant3_entity_7125387a5b
    port map (
      baopoco_quant3_addr_user_data_out => baopoco_quant3_addr_user_data_out_net,
      baopoco_quant3_gain_user_data_out => baopoco_quant3_gain_user_data_out_net,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      din0 => bram0_data_out_net_x6,
      din1 => bram1_data_out_net_x6,
      sync => post_sync_delay_q_net_x7,
      clip_out => delay5_q_net_x11,
      dout0 => concat_y_net_x8,
      dout1 => concat_y_net_x9
    );

  slice12: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 31,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay21_q_net,
      y => slice12_y_net_x9
    );

  slice13: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 23,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay21_q_net,
      y => slice13_y_net_x9
    );

  slice15: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay21_q_net,
      y => slice15_y_net_x9
    );

  slice20: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay21_q_net,
      y => slice20_y_net_x9
    );

  slice26: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 16,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => baopoco_ctrl_user_data_out_net,
      y(0) => slice26_y_net_x0
    );

  slice31: entity work.xlslice
    generic map (
      new_lsb => 17,
      new_msb => 17,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => baopoco_ctrl_user_data_out_net,
      y(0) => slice31_y_net_x0
    );

  slice32: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 18,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => baopoco_ctrl_user_data_out_net,
      y(0) => slice32_y_net_x0
    );

  slice36: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 31,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay20_q_net,
      y => slice36_y_net_x9
    );

  slice37: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 23,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay20_q_net,
      y => slice37_y_net_x9
    );

  slice38: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay20_q_net,
      y => slice38_y_net_x9
    );

  slice39: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => delay20_q_net,
      y => slice39_y_net_x9
    );

  slice6: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 12,
      x_width => 32,
      y_width => 13
    )
    port map (
      x => baopoco_fft_shift_user_data_out_net,
      y => slice6_y_net_x23
    );

  status_49c80f525d: entity work.acc_num_entity_e7d623cae3
    port map (
      reg_out => concat1_y_net_x1,
      convert_x0 => baopoco_status_user_data_in_net
    );

  sync_gen_2b392bb40e: entity work.sync_gen_entity_2b392bb40e
    port map (
      arm => delay15_q_net_x1,
      ce_1 => ce_1_sg_x869,
      clk_1 => clk_1_sg_x869,
      pps => logical3_y_net_x1,
      mrst => delay1_q_net_x6,
      sync => delay2_q_net_x42
    );

end structural;
