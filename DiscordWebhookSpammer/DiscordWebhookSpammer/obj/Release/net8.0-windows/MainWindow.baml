   M S B A M L   `   `   `  ����   DiscordWebhookSpammer    WebhookSpammer.MainWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  Webhook Spammer��$	��400��$	��400�����	#FF181818 � WindowStartupLocation$ CenterScreen=� � 	Resources  �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius	 J� RenderTransformOrigin
 �� ScaleX �� ScaleY �� Triggers P� Property P� Value N� EnterActions �� 
TargetName �� TargetProperty	 W� To g� Duration N� ExitActions   FadeInContainerStyle �� Triggers :� RoutedEvent��%�  '��       &	  &    �� " ��.���  � �� �	#FF3A3A3A��  � ��
 �������  � ��$	 6,3q���  �@�Cursor$
 Hand����  � �� �	#FF505050��  � ��$ 1q���  � �� �� " ��.R�� .+��� $ border��#��z��#��z��#��z��$ 4��$	 0.5,0.5&�z��� $	
 1.0Q�$	 1.0Q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True�� �� .���� .��W� $ border��$9 3(UIElement.RenderTransform).(ScaleTransform.ScaleX)� 1.1$ 0:0:0.2D�W� $ border��$9 3(UIElement.RenderTransform).(ScaleTransform.ScaleY)� 1.1$ 0:0:0.2D� �� .���� .��W� $ border��$9 3(UIElement.RenderTransform).(ScaleTransform.ScaleX)� 1.0$ 0:0:0.2D�W� $ border��$9 3(UIElement.RenderTransform).(ScaleTransform.ScaleY)� 1.0$ 0:0:0.2D��� " ��.���  �@J�Opacity$ 0Q� :� $ Loaded��.[��� .���� .��W� $ Opacity� 1$ 0:0:0.5D�.��� $��10q�.+��� .+��� $��Webhook Spammer��$��22(�$
��Bold"�
����i��$��Center=�$��0,0,0,10q��� #��[   �� Padding$ 10q�$ 8�����	#FF2D2D30._��� .+��� -    ��Name$ WebhookUrlTextBox��$��30��$��0,0,0,8q�$��6q����	#FF1E1E1E
�������$��1q�
�������$��Webhook URL���� -   $ MessageTextBox��$��60��$��0,0,0,8q�$��6q����	#FF1E1E1E
�������$��1q�
������� �� TextWrapping$
 Wrap=� �� AcceptsReturn$
 True��$��	Nachricht����  �� Orientation$ 
Horizontal=�$��Center=�.+��� -    ��Name$ 
SendButton��$��80��$��0,0,8,0q�$
��Send���� -   $ 
StopButton��$��80��$
��Stop��