   M S B A M L   `   `   `  ����F  BVoiceClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:VoiceClientVoiceClient  5   	       VoiceClient.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:VoiceClient     5   	     � WindowStyle$
  None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowState$ 	Maximized=�5	   	   $��0q�5
   	   
����·� � 	Resources 5         hearingBoard �� 
TargetName �� TargetProperty �� From	 �� To g� AutoReverse	 g� RepeatBehavior
 g� Duration  
voiceBoard W� From	 W� To  thoughtBoard��%  &	        &	 s    &	 3    �� 5   
   .��5      �� $ leftEar��6   $ Stroke.Color�5      $ DarkBlueX�5      $ WhiteX�5       . $	 Forever��5      $
 00:00:00.50D�5      5      �� 5      $ rightEar��6   $ Stroke.Color�5      $ DarkBlueX�5      $ WhiteX�5       . $	 Forever��5      $
 00:00:00.50D�5      5       5!      �� 5"   
   .��5#      W� $ voiceEllipse��5$      $ Height�5%      $ 1X�5&      $	 200X�5'      $
 00:00:00.20D�5(      $	 Forever��5)       . 5,      5-      �� 50   
   .��51      W� $ thoughtCloud��6   $ Opacity�52      $ 0X�53      $	 0.7X�54       . $	 Forever��56      $
 00:00:02D�57      59      5:      5;      .��5<      �� $
��10,0q�6   .+�5>   
   �� -   5         ��Name$ btnSpeak��5>      $
��Talk��6#   $
��Left=�62   $	��Top=�6M   $��75��6e    �� Left$ 10��6q   
 �� Top$ 10��6�   $y�Visible=�6�   �� 5?   
   -   5        $ btnHear��5?      $��Listen��6"   $
��Left=�63   $	��Top=�6N   $��75��6f   $ 10��6r   $ 58��6�   $y�Visible=�6�   �� 5@   
   -   5        $ btnThink��5@      $��Think��6#   $
��Left=�63   $	��Top=�6N   $��75��6f   $ 10��6r   $ 34��6�   $y�Visible=�6�   �� 5A   
   -   5        $ btnScenarioTest��5A      $
��Test��6*   $
��Left=�6W   $	��Top=�6r   $��75��6�   $ 10��6�   $ 82��6�   $y�Visible=�6�   �� 5B   
   -   5         ��Name$ txtWhatHeard��5B      $	��248��6*   $	��510��66   $	 484��6C   $ 9��6U   $
��Wrap=�6d   6z   �� 5E   
   -   5         ��Name$ thoughtCloud��5E      $ ��Resources/Thoughtcloud.png��6&   $	��104��6J    J� Opacity$ 0Q�6W   $	 202��6c   $	��262��6u   $ 10��6�    J� RenderTransformOrigin$ 0.524,0.514&�6�   �� 5I   
   -   5         ��Name$ leftEye��5I      
����  �$��3��67   
���**��$��20��6X   $��30��6c   $	 279��6o   $	 119��6�   �� 5J   
   -   5        $ rightEye��5J      
����  �$��3��68   
���**��$��20��6Y   $��30��6d   $	 361��6p   $	 119��6�   F� 5M   
   -	   5         F�Name$ leftEar��5M      
����  �$��3��62   $ 1Q�6F   $ 202.3��6R   $ 162.4��6f   )����        Ӏig����  -1 -1���	6y   F� 5N   
   -
   5        $ rightEar��5N      
����  �$��3��63   $ 1Q�6G   $ 460.7��6S   $ 162.4��6g   )����        Ӏ�� ���  ��� -1���	6z   F� 5Q   
   -   5        $ 
smileyPath��5Q      
����  �$��3��65   $	 231��6I   $	 251��6[   )����        Ӏ�� ���In
��� ��	6l   A� 5R   
   -   5         A�Name$ voiceEllipse��5R      
����  �$��3��6:   
����·�$	��200��6]   $��3��6i   $	 231��6t   $	 251��6�   $y�	Collapsed=�6�   5S      5T      