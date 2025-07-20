module fork_exit_after_two;

  int done_count = 0;
  event two_done;
  task automatic do_work(int id, int delay); // if dont use automatic here then only task 4 will executes
    #(delay);
    $display("[%0t] Task %0d DONE with delay %0d", $time, id, delay);

    // Increment count and check
    done_count++;
    if (done_count == 3)
      -> two_done; // Signal after 2 complete
  endtask

  initial begin
    $display("\n[%0t] Starting all tasks...", $time);

    fork :task_fork
      //begin
      do_work(0, 20); //end  // finishes at 20
     // begin
      do_work(1, 40); //end // finishes at 40
      //begin
      do_work(2, 60); //end // finishes at 60
      begin
        do_work(3, 80); end // finishes at 80
      begin
        do_work(4, 100);end // finishes at 100
    join_none // Let all tasks run in background

    // Wait for exactly 2 completions
    @two_done;
    $display("[%0t] %0d tasks finished. Exiting others...", $time, done_count);

    // Kill remaining tasks
    disable task_fork;
      $display("[%0t] Remaining tasks disabled\n", $time);
  end

endmodule
/*

# KERNEL: [0] Starting all tasks...
# KERNEL: [20] Task 0 DONE with delay 20
# KERNEL: [40] Task 1 DONE with delay 40
# KERNEL: [60] Task 2 DONE with delay 60
# KERNEL: [60] 3 tasks finished. Exiting others...
# KERNEL: [60] Remaining tasks disabled
# KERNEL: 
