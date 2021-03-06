%% MD_RUN is a script to run MD with prescribed input.
%
  filename = 'md_output.txt';
  fnamepos = 'md_output_positions.txt';

  delete ( filename );

  diary ( filename );

  nd = 2;
  np = 2;
  step_num = 5000;
  dt = 0.01;

  md ( nd, np, step_num, dt, fnamepos );

  diary ( 'off' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   written to "%s"\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

